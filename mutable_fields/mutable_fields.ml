(* The fields of a record can be declared as mutable, 
meaning their contents can be updated without constructing
a new record. For example, here is a record type for 
two-dimensional colored points whose color field c is mutable: *)

type pointer = {
  x: int;
  y: int;
  mutable c: string;
  }
  
let l = {
  x = 0;
  y = 0;
  c = "red";
}
    
(* The operator to update a mutable field is <- *)
(* 
  # l;;
  - : pointer = {x = 0; y = 0; c = "red"}

  # l.c <- "white";;
  - : unit = ()

  # l;;
  - : pointer = {x = 0; y = 0; c = "white"}

  # l.x <- 3
  Error: The record field x is not mutable
*)

(* Syntax and Semantics *)

(* 
  Syntax : e1.f <- e2

  Dynamic semantics: To evaluate e1.f <- e2, evaluate e2 
  to a value v2, and e1 to a value v1, which must have a field named f. 
  Update v1.f to v2. Return ().

  Static semantics: e1.f <- e2 : unit if e1 : t1 and t1 = {...; mutable f : t2; ...}, 
  and e2 : t2.
*)

(* Refs and Mutable Fields *)

(* It turns out that refs are actually implemented as mutable fields. 
In Stdlib we find the following declaration: *)

type 'a ref = { mutable contents : 'a; }

(* And that's why when we create a ref it does in fact looks like a record: it is a record! *)

let r = ref 3110;
(* val r : int ref = { contents = 3110 } *)

(* The other syntax we've seen for records is in fact equivalent to simple OCaml functions: *)

(* 
Equivalent to [fun v -> {contents=e}].
val ref : 'a -> 'a ref

Equivalent to [fun r -> r.contents].
val (!) : 'a ref -> 'a

Equivalent to [fun r v -> r.contents <- v].
val (:=) : 'a ref -> 'a -> unit
*)
