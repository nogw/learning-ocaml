type point = float * float

type day = Sun | Mon | Tue | Wed | Thu | Fri | Sat

type shape = 
  | Point of point
  | Circle of point * float
  | Rect of point * point
  
type 'a mylist = Nil | Cons of 'a * 'a mylist

(* type fin_or_inf = Finite of int | Infinity *)
(* no type definition *)
let f = function
  | 0 -> `Infinity
  | 1 -> `Finite 1
  | n -> `Finite (-n)


let _ = 
  match f 3 with
  | `NegInfinity -> "negative infinity"
  | `Finite n    -> "finite"
  | `Infinity    -> "infinite"
;;