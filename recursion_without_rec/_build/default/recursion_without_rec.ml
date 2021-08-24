(* let rec fact n =
  if n = 0 then 1 else n * fact (n-1)

(* We can instead write the following: *)

let f0 = 
  ref (fun x -> x)

let f x =
  !f0 x 

let () = f0 := f *)

(* Here's an example of that with the factorial function *)

let fact0 =
  ref (fun x -> x)
let fact n = 
  if n = 0 then 1 else n * (!fact0) (n-1)

let () = fact0 := fact
let y = fact 5 (* 120 *)
let _ = print_int y