let rec lastItem = 
  function
  | [] -> None
  | [x] -> Some x
  | _ :: x -> lastItem x
;;

let _ = 
  lastItem [2; 3; 4] 
  |> Option.iter (Printf.printf "%d") 
;;