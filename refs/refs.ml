(* A ref is like a pointer or reference in an imperative language. 
It is a location in memory whose contents may change *)

(* 
# let x = ref 0;;
val x : int ref = { contents = 0 }

# !x;;
- : int = 0

# x := 1;;
- : unit = ()

# !x;;
- : int = 1
*)

(* Aliasing *)

(* Now that we have refs, we have aliasing: two refs could point 
to the same memory location, hence updating through one causes 
the other to also be updated. *)

let x = ref 42
let y = ref 42
let z = x
let () = x := 43
let w = (!y) + (!z)

(* The result of executing that code is that w is bound to 85, 
because let z = x causes z and x to become aliases, hence updating 
x to be 43 also causes z to be 43. *)