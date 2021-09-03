(* parse "22" *)
(* - : expr = Int 22 *)

(* parse "1+2+3" *)
(* - : expr = Binop (Add, Binop (Add, Int 1, Int 2), Int 3) *)

(* parse "var x = 2 in 20 + x" *)
(* - : expr = Let ("x", Int 2, Binop (Add, Int 20, Var "x")) *)

(* Errors *)

(* parse "3.14" *)
(* Exception: Failure "lexing: empty token". 
-> because floats were not specified *)

(* parse "3+" *)
(* Exception: Parser.MenhirBasics.Error.
-> because the operation needs an int after the operator*)
