let add x y = x + y
(* val add : int -> int -> int *)

let add' t = (fst t) + (snd t)
(* val add' : int * int -> int *)

let add'' (x, y) = x + y
(* val add'' : int * int -> int *)