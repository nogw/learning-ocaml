let rec sum = function
  | [] -> 0
  | h::t -> h + sum t

let rec concat = function
  | [] -> ""
  | h::t -> h ^ concat t 

(* So can we apply the Abstraction Principle again? Sure! This time 
we need to factor out two arguments: one for each of those two differences *)

let rec sum1' init = function
  | [] -> init
  | h::t -> h + sum1' init t 

let sum1 = sum1' 0

let rec concat1' init = function
  | [] -> init
  | h::t -> h ^ concat1' init t

let concat1 = concat1' ""

(* Now the only real difference left between sum' and concat' is the operator. 
That can also become an argument to a unified function we call combine: *)

let rec combine op init = function
  | [] -> init
  | h::t -> op h (combine op init t)

let sum2 = combine (+) 0
let concat = combine (^) ""

(* The combine function is the basis for an OCaml library 
function named List.fold_right. Here is its implementation *)

let rec fold_right op lst init =
  match lst with
  | [] -> init
  | h::t -> op h (fold_right op t init)

let sum3 lst = fold_right (+) lst 0 
let concat3 lst = fold_right (^) lst "" 