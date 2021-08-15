let rec concat = function
  | [] -> ""
  | h::t -> h ^ concat t 
;; 

let _ = 
  let lst = ["O"; "C"; "a"; "m"; "l"] in
  print_string(concat lst)
;;