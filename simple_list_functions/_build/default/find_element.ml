open Utils
let rec find_element l v = 
  match l with
  | [] -> 0
  | hd::tl -> if v = hd then 0 else 1 + find_element tl v
;;

let _ = 
  let l = [1; 3; 5; 2; 5; 4; 2; 6; 2] in
  Utils.print_list_int l;
  
  print_string "\n";

  let v = int_of_string Sys.argv.(1) in
  print_int (find_element l v)
;;