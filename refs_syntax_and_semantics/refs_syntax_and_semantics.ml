(* syntax *)

(* 
Ref creation: ref e

Ref assignment: e1 := e2

Dereference: !e
*)

(* dynamic semantics *)

(* 
To evaluate ref e,

  Evaluate e to a value v

  Allocate a new location loc in memory to hold v

  Store v in loc

  Return loc

To evaluate e1 := e2,

  Evaluate e2 to a value v, and e1 to a location loc.

  Store v in loc.

  Return (), i.e., unit.

To evaluate !e,

  Evaluate e to a location loc.

  Return the contents of loc.
*)

(* Static Semantics *)

(* We have a new type constructor, ref, such that t ref is a type 
for any type t. Note that the ref keyword is used in two ways: 
as a type constructor, and as an expression that constructs refs. *)

(* 
ref e : t ref if e : t.

e1 := e2 : unit if e1 : t ref and e2 : t.

!e : t if e : t ref.
*)