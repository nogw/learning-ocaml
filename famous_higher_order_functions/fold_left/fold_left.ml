(* List.fold_left implementation *)
let rec fold_left op acc = function
  | [] -> acc 
  | h::t -> fold_left op (op acc h) t


let rec sum' acc = function
  | [] -> acc
  | h::t -> sum' (acc + h) t 

let sum = List.fold_left (+) 0
let concat = List.fold_left (^) ""

let rec fold_left f acc l = 
  match l with
  | [] -> acc
  | h::t -> fold_left f (f acc h) t

let rec fold_right f l acc = 
  match l with
  | [] -> acc
  | h::l -> f h (fold_right f l acc) 