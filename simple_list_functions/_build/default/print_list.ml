(* let print_list = function
  | [] -> []
  | _ -> List.iter (Printf.printf "%d ") x
;; *)

let rec print_list = function
  | [] -> []
  | hd :: tl -> Printf.printf "%d;" hd; print_list tl  
;;

let _ = 
  let k = [1; 2; 3] in
  print_list k
;;