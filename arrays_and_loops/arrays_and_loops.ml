let v = [|0.; 1.|]
(* val v : float array = [|0.;1.|] *)

let _ = 
  v.(0) <- 5.;
  (* - : unit = () *)
  v;;
  (* val v : float array = [|5.;1.|] *)

(* 
Syntax and Semantics 

  Array creation: [|e0; e1; ...; en|]

  Array indexing: e1.(e2)

  Array assignment: e1.(e2) <- e3
*)

(* 
Static semantics.

  [|e0; e1; ...; en|] : t array if ei : t for all the ei.

  e1.(e2) : t if e1 : t array and e2 : int.

  e1.(e2) <- e3 : unit if e1 : t array and e2 : int and e3 : t.
*)

(* Loops *)

(* Syntax *)

while e1 do e1 done
for x = e1 to e2 do e3 done
for x = e1 downto e2 do e3 done