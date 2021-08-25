type 'a mylist = Nil | Cons of 'a * 'a mylist

(* [3] *)
let lst3 = Cons (3, Nil)
(* ["hi"] *)
let lst_hi = Cons ("hi", Nil)

(* omitted type *)
let rec length = function 
  | Nil -> 0
  | Cons (_, t) -> 1 + length t 
let empty = function
  | Nil -> true 
  | Cons _ -> false

let rec sum = function
  | Nil -> 0 
  | Cons (h, t) -> h + sum t

(* multiple type parameters for a parameterized type *)
type ('a, 'b) pair = { 
  first: 'a;
  second: 'b
};;
let x = { first = 2; second = "three" }
let y = { first = "two"; second = 3 }