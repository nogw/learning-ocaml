let counter = ref 0
let next_val = 
  fun () ->
    counter := (!counter) + 1;
    !counter;;

(* 
Second, the way we coded the counter currently exposes the counter 
variable to the outside world. Maybe we're prefer to hide it so 
that clients of next_val can't directly change it. We could do so 
by nesting counter inside the scope of next_val:
*)

let next_val = 
  let counter = ref 0
  in fun () ->
    incr counter;
    !counter 

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
  (* - : int = 1 *)
  next_val_broken() |> string_of_int |> print_endline;
  (* - : int = 1 *)
  next_val_broken() |> string_of_int |> print_endline
  (* - : int = 1 *)

(* 
The problem is that every time next_val_broken is called, 
the first thing it does is to evaluate ref 0 to a new 
location that is initialized to 0. That location is then 
incremented to 1, and 1 is returned. Every call to 
next_val_broken is thus allocating a new ref cell, whereas 
next_val allocates just one new ref cell. 
*)