type nat = Zero | Succ of nat

let zero = Zero
let one = Succ zero
let two = Succ one
let three = Succ two
let four = Succ three
let five = Succ four

(* 
val zero : nat = Zero
val one : nat = Succ Zero
val two : nat = Succ (Succ Zero)
val three : nat = Succ (Succ (Succ Zero))
val four : nat = Succ (Succ (Succ (Succ Zero)))
val five : nat = Succ (Succ (Succ (Succ (Succ Zero)))) 
*)

let is_zero (n: nat): bool =  
  match n with
  | Zero -> true
  | Succ m -> false
;;