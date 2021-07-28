let rec lastItem = 
  function
  | [] -> None
  | [x] -> Some x
  | _ :: x -> lastItem x
;;

let () = 
  lastItem [2; 3; 4; 2; 1]
  |> Option.iter (Printf.printf "%d")
;;