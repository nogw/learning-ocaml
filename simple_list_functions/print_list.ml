let rec print_list = function
  | [] -> []
  | hd :: tl -> Printf.printf "%d;" hd; print_list tl  
;;

let _ = 
  let k = [1; 2; 3] in
  print_list k
;;