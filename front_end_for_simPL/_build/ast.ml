(* Earlier, we already developed an AST type: *)

type bop = 
  | Add
  | Mult
  | Leq

type expr =
  | Var of string
  | Int of int
  | Bool of bool
  | Binop of bop * expr * expr 
  | Let of string * expr * expr
  | If of expr * expr * expr
  | Pairs of expr * expr