let apply f x = f x

(* The pipeline operator, is a higher-order function *)
let pipeline x f = f x
let (|>) = pipeline
let double v = v * 2 
let square v = v * v 
let x = 5 |> double

let _ = print_int x

(* we can write a function that composes 
two other functions *)
let compose f g x = f (g x)
let square_then_double = compose double square
let y = square_then_double 1
let x = square_then_double 2

(* we can write a function that applies two 
functions to the same argument and returns 
a pair of the result: *)

let both f g x = (f x, g x)
let ds = both double square
let p = ds 3 (* (6, 9) *)

(* We can write a function that conditionally
chooses which of two functions to apply 
based on a predicate *)

let cond p f g x =
  if p x then f x else g x