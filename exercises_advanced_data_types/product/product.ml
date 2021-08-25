let product_of_list lst =
  let rec aux a l = 
    match l with
    | [] -> a
    | h::t -> aux (a * h) t 
  in
    aux 1 lst
;;

let _ =
  let lst = [1; 2; 3; 4; 5] in
  print_int(product_of_list lst)
;;