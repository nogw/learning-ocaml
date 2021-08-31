(* As a running example for the next few sections, 
we'll use a very simple programming language that we call SimPL.
Here is its syntax in BNF: *)

(* 
e ::= x | i | b | e1 bop e2
        | if e1 then e2 else e3
        | let x = e1 in e2

bop ::= + | * | <=

x ::= <indetifiers>

i ::= <integers>

b ::= true | false 
*)

(* The AST *)

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

(* There is one constructor for each of the syntactic forms of expressions in the BNF. 
For the underlying primitive syntactic classes of identifiers, integers, and booleans, 
we're using OCaml's own string, int, and bool types.

Instead of defining the bop type and a single Binop constructor, we could have defined 
three separate constructors for the three binary operators: *)