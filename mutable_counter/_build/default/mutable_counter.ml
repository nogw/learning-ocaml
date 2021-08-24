
(* 
Now counter is in scope inside of next_val, but not accessible outside that scope. 

First, the expression ref 0 is evaluated. That returns a location loc, 
which is an address in memory. The contents of that address are initialized to 0.

Second, everywhere in the body of the let expression that counter occurs, 
we substitute for it that location. So we get:

fun () -> incr loc; !loc
*)

(* Now imagine that we instead had written the following (broken) code:*)

let next_val_broken = fun () -> 
  let counter = ref 0
  in incr counter;
    !counter

let _ =
  next_val_broken() |> string_of_int |> print_endline;
  next_val_broken() |> string_of_int |> print_endline;
  next_val_broken() |> string_of_int |> print_endline