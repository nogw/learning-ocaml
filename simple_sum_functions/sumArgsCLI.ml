let sum a b =
  a + b;   
;;

let _ =
  let i = int_of_string Sys.argv.(1)
  and j = int_of_string Sys.argv.(2) in
  
  Printf.printf "%d\n" (sum i j)
;;