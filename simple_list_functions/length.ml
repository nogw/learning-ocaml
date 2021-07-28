let rec length = function
  | [] -> 0
  | _::tl -> 1 + length tl
;;

length [1; 2; 4]