(* f_1: int -> [> `Finite of int | `Infinity 0] *)
type fin_or_inf = Finite of int | Infinity
let f = function
  | 0 -> Infinity
  | 1 -> Finite 1
  | n -> Finite (-n)
;;

(* no type definition, using polymorphic variant *)
let f_1 = function
  | 0 -> `Infinity
  | 1 -> `Finite 1
  | n -> `Finite (-n)
;;

let _ = 
  let x =
    match f_1 3 with
      | `Infinity -> "infinity"
      | `Finite x -> string_of_int x 
    in
      print_endline x;

  let y =
    match f 3 with
      | Infinity -> "infinity"
      | Finite y -> string_of_int y 
    in
      print_endline y;
;;