let rec last = function
  | [] -> None
  | [x] -> Some x
  | _::t -> last t

let any_zeroes lst =
  let rec aux n l =
    if n = 0 then true else 
    match l with
    | [] -> false  
    | h::t -> aux h t;
  in
    aux 1 lst
;;

let _ = 
  let lst = [1; 2; 3; 4; 0] in
  print_string (string_of_bool (any_zeroes lst))
;;