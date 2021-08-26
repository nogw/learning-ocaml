let inc = fun x -> x + 1
let init = ref 0

let rec create_3110_loop x =
  match x with
  | x when (x > 3110) -> init := x
  | _ -> create_3110_loop (inc x) 

(* or *)

let rec create_2110_loop x = 
  match !x with
  | x when (x > 2110) -> x
  | _ -> init := (inc !x); 
  create_2110_loop (init)

let _ = 
  !init |> string_of_int |> print_endline;
  let _ = create_2110_loop init in
  !init |> string_of_int |> print_endline;