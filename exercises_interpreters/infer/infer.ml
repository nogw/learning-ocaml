(* 
code to infer type

let infer (e: string) =
  let s = parse e in
  typeof empty s
*)

(* "3100" *)
(* - : typ = TInt *)

(* 1 <= 2 *)
(* - : typ = TBool *)

(* var x = 2 in 20 + x *)
(* - : typ = TInt *)