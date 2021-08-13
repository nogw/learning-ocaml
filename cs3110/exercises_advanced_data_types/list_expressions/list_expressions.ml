let rec print_list = function
  | [] -> []
  | h::t -> Printf.printf "%d; " h; print_list t
;;
  
let lst = [1; 2; 3];;
let lst1 = (1 :: (2 :: (3 :: [])));;
(* let lst1 = 1 :: 2 :: 3 :: [];; *)
let lst2 = [1] @ [2] @ [3] @ []

let _ = 
  print_list lst;;
  print_endline "";;
  print_list lst1;;
  print_endline "";;
  print_list lst2;;
;;