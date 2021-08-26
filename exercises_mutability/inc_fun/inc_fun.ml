let inc = fun x -> x + 1
let init = ref 0

let rec create_3110_loop x i =
  match i with
  | i when (i >= 3110) -> x := i
  | _ -> create_3110_loop x (inc i) 

let rec create_3111_loop x = 
  match !x with
  | x when (x >= 3111) -> x
  | _ -> x := (inc !x); 
  create_3111_loop (init)