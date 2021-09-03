open Ast

let parse (s: string) : expr =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast
  
(* parse "var x = 3110 in x + x"  *)
(* - : expr = Let ("x", Int 3110, Binop (Add, Var "x", Var "x")) *)

type typ = 
  | TInt
  | TBool

module type Context = sig
  type t
  val empty : t
  val lookup : t -> string -> typ
  val extend : t -> string -> typ -> t
end

module Context: Context = struct
  type t = (string * typ) list
  let empty = []
  let lookup ctx x =
    try 
      List.assoc x ctx
    with Not_found -> failwith "Unbound variable"
  let extend ctx x ty =
    (x, ty) :: ctx 
end

open Context

let rec typeof ctx = function
  | Int _ -> TInt
  | Bool _ -> TBool
  | Var x -> lookup ctx x
  | Let (x, e1, e2) -> typeof_let ctx x e1 e2
  | Binop (bop, e1, e2) -> typeof_bop ctx bop e1 e2
  | If (e1, e2, e3) -> typeof_if ctx e1 e2 e3
  
and typeof_let ctx x e1 e2 =
  let t1 = typeof ctx e1 in
  let ctx' = extend ctx x t1 in
  typeof ctx' e2

and typeof_bop ctx bop e1 e2 =
  let t1, t2 = typeof ctx e1, typeof ctx e2 in  
  match bop, t1, t2 with
  | Add, TInt, TInt
  | Mult, TInt, TInt -> TInt
  | Leq, TInt, TInt -> TBool
  | _ -> failwith "Operator and operand type mismatch"

and typeof_if ctx e1 e2 e3 =
  if typeof ctx e1 = TBool then
    begin
      let t2 = typeof ctx e2 in
      if t2 = typeof ctx e3 then
        t2
      else 
        failwith "Branches of if must have same type"
    end
  else 
    failwith "Guard of if must have type bool"

let typecheck e =
  ignore (typeof empty e)

let is_value : expr -> bool = 
  function
  | Int _ | Bool _ -> true
  | Var _ | Let _ | Binop _ | If _ -> false

let rec subst e v x = 
  match e with
  | Var y -> if y = x then v else e
  | Bool _ -> e
  | Int _ -> e
  | Binop (bop, e1, e2) -> Binop (bop, subst e1 v x, subst e2 v x)
  | Let (y, e1, e2) ->
    let e1' = subst e1 v x in
    if x = y then
      Let (y, e1', e2)
    else 
      Let (y, e1', subst e2 v x)
  | If (e1, e2, e3) ->
    If (subst e1 v x, subst e2 v x, subst e3 v x) 

let rec step : expr -> expr = function
  | Int _ | Bool _ -> failwith "Does not step" 
  | Var _ -> failwith "Unbound variable"
  | Binop (bop, e1, e2) when is_value e1 && is_value e2 ->
    step_bop bop e1 e2
  | Binop (bop, e1, e2) when is_value e1 ->
    Binop (bop, e1, step e2)
  | Binop (bop, e1, e2) -> Binop (bop, step e1, e2)
  | Let (x, e1, e2) when is_value e1 -> subst e2 e1 x
  | Let (x, e1, e2) -> Let (x, step e1, e2)
  | If (Bool true, e2, _) -> e2
  | If (Bool false, _, e3) -> e3
  | If (Int _, _, _) -> failwith "Guard of if must have type bool"
  | If (e1, e2, e3) -> If (step e1, e2, e3)

and step_bop bop e1 e2 = 
  match bop, e1, e2 with
  | Add, Int a, Int b -> Int (a + b)
  | Mult, Int a, Int b -> Int (a * b)
  | Leq, Int a, Int b -> Bool (a <= b) 
  | _ -> failwith "Operator and operand type mismatch"

(* The Multistep Relation *)

(* Of course, in implementing an interpreter, what we really want is to take multiple steps 
until the expression reaches a value. That is, we want to take as many steps as possible. 
So, we're interested in the sub-relation e -->* v in which the right-hand side is a value. 
That's easy to implement: *)

let rec eval_small (e : expr) : expr =
  if is_value e then 
    e
  else 
    e |> step |> eval_small 

(* Defining the Big-Step Relation 

Binary operators just big-step both of their subexpressions, then apply 
whatever the primitive operator *)

(* Implementing the Big-Step Relation *)

let rec eval_big (e: expr) : expr =
  match e with
  | Int _ | Bool _ -> e
  | Var _ -> failwith "Unbound value"
  | Binop (bop, e1, e2) -> eval_bop bop e1 e2
  | Let (x, e1, e2) -> subst e2 (eval_big e1) x |> eval_big
  | If (e1, e2, e3) -> eval_if e1 e2 e3

and eval_bop bop e1 e2 =
  match bop, eval_big e1, eval_big e2 with
  | Add, Int a, Int b -> Int (a + b)
  | Mult, Int a, Int b -> Int (a * b)
  | Leq, Int a, Int b -> Bool (a <= b)
  | _ -> failwith "Operator and operand type mismatch" 

and eval_if e1 e2 e3 =
  match eval_big e1 with
  | Bool true -> eval_big e2
  | Bool false -> eval_big e3
  | _ -> failwith "Guard of if must have type bool"

let interp_big (s : string) : expr = 
  let e = parse s in
  typecheck e;
  eval_big e