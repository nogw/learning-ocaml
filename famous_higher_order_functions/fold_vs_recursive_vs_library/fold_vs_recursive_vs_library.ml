let rec lst_and_rec = function
  | [] -> true
  | h::t -> h && lst_and_rec t

let lst_and_fold = 
  List.fold_left (fun acc elt -> acc & elt) true
  
let lst_and_lib =
  List.for_all (fun x -> x)