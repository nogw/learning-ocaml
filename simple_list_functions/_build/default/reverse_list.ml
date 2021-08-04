open Utils

let reverse_list list = 
  let rec rvl l = function
    | [] -> l
    | hd :: tl -> rvl (hd :: l) tl in
  rvl [] list
;;

let _ = 
  let list = ["l"; "m"; "a"; "C"; "O"] in
  let rvlist = reverse_list list in
  Utils.print_list_str rvlist
;;