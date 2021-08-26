let (+:=) a b =
  a := !a + b

let x = ref 10
let _ = x := 10
let y = ref 10
let _ = y +:= 10

let () =
  !x |> string_of_int |> print_endline;
  !y |> string_of_int |> print_endline;