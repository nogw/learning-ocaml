type intlist = Nil | Cons of int * intlist

let lst3 = Cons (3, Nil)
(* [3] *)
let lst123 = Cons (1, Cons(2, lst3))
(* [1; 2; 3] *)

let rec sum (l: intlist): int = 
  match l with
  | Nil -> 0
  | Cons (h, t) -> h + sum t

let rec lenght: intlist -> int = function
  | Nil -> 0
  | Cons (_, t) -> 1 + lenght t

let empty: intlist -> bool = function
  | Nil -> true
  | Cons _ -> false

type node = { value: int; next: mylist }
and mylist = Nil | Node of node

type t = U of u and u = T of t
