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

let pred (n: nat): nat = 
  match n with
  | Zero -> failwith "pred Zero is undefined"
  | Succ m -> m

let rec add (n1: nat) (n2: nat) : nat =
  match n1 with
  | Zero -> n2
  | Succ n_minus_1 -> add n_minus_1 (Succ n2)
;;

let rec int_of_nat (n: nat) : int = 
  match n with
  | Zero -> 0
  | Succ m -> 1 + int_of_nat m
;;

let rec nat_of_int (i: int) : nat = 
  if i < 0 then failwith "nat_of_int is undefined on negative ints"
  else if i = 0 then Zero
  else Succ (nat_of_int (i-1))
;;

let rec 
  even (n: nat) : bool =
    match n with
    | Zero -> true
    | Succ m -> odd m
and 
  odd (n: nat) : bool = 
    match n with
    | Zero -> false
    | Succ m -> even m
  
