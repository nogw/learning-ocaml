let r1 = ref 3110
(* val r1 : int ref = { contents = 3110 } *)
let r2 = ref 3110
(* val r2 : int ref = { contents = 3110 } *)

let _ =
  r1 == r1 |> string_of_bool |> print_endline;
  r1 == r2 |> string_of_bool |> print_endline;
  r1 != r2 |> string_of_bool |> print_endline;
  r1 = r1 |> string_of_bool |> print_endline;
  r1 = r2 |> string_of_bool |> print_endline;
  r1 <> r2 |> string_of_bool |> print_endline;