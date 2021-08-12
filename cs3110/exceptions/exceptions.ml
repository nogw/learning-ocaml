exception Something_went_wrong
exception Argument_not_found of string

let return_throw = function
  | 0 -> raise Something_went_wrong
  | _ -> 1

let _ =
  let x =
    match List.hd [] with
      | [] -> "empty"
      | _ :: _ -> "nonempty"
      | exception (Failure s) -> s 
    in
      print_endline x;
  ;
;;