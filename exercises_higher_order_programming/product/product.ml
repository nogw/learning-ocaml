let product_left =
  List.fold_left ( *. ) 1.0

let product_right lst = 
  List.fold_right  ( *. ) lst 1.0

let rec print_list =
  function
  | [] -> []
  | h::t -> print_float h; print_list t

let _ = 
  let lst = [1.; 2.; 4.; 8.; 3.] in
  print_float (product_right lst)