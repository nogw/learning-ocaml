let rec concat l =
  let rec aux s ls = 
  match ls with
    | [] -> s
    | h::t -> aux (s ^ h) t;
  in aux "" l 
;; 

let _ = 
  let lst = ["O"; "C"; "a"; "m"; "l"] in
  print_string(concat lst)
;;