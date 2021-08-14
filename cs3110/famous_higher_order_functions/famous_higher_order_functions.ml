(* add 1 to each element of list *)
let rec add1 = function
  | [] -> []
  | h::t -> (h+1)::(add1 t) 

(* concat "3110" to each element of list *)
let rec concat3110 = function
  | [] -> []
  | h::t -> (h ^ "3110")::(concat3110 t) 

(* 
  when given input [a; b; c] they produce these results:
  add1:       [a+1;      b+1;      c+1]
  concat3110: [a^"3110"; b^"3110"; c^"3110"]
 *)

(* lets introduce these definitions *)
let f = fun x -> x + 1
let g = fun x -> x ^ "3110"

let rec map f = function
  | [] -> []
  | h::t -> (f h)::(map f t) 

let add1v2 = map (f)
let concat3110v2 = map (g)