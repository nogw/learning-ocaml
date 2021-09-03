(* parse "1*2*3" *)

(*%left
  - : expr = Binop (Mult, Binop (Mult, Int 1, Int 2), Int 3) *)

(*%right 
  - : expr = Binop (Mult, Int 1, Binop (Mult, Int 2, Int 3)) *)


(* parse "1+2*3" *)

(*%left PLUS
  %left TIMES 
  - : expr = Binop (Add, Int 1, Binop (Mult, Int 2, Int 3)) *)

(*%left TIMES
  %left PLUS
  - : expr = Binop (Mult, Binop (Add, Int 1, Int 2), Int 3) *)