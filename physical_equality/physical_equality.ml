let r1 = ref 3110
(* val r1 : int ref = { contents = 3110 } *)
let r2 = ref 3110
(* val r2 : int ref = { contents = 3110 } *)

(* One interpretation could be that == should be used only when 
comparing refs (and other mutable data types) to see whether 
they point to the same location in memory. Otherwise, don't use ==. *)

(* The negation of physical equality is !=, and the negation of 
structural equality is <>. This can be hard to remember. *)

let _ =
  r1 == r1 |> string_of_bool |> print_endline;
  r1 == r2 |> string_of_bool |> print_endline;
  r1 != r2 |> string_of_bool |> print_endline;
  r1 = r1 |> string_of_bool |> print_endline;
  r1 = r2 |> string_of_bool |> print_endline;
  r1 <> r2 |> string_of_bool |> print_endline;