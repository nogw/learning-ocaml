module type X = sig
  val x : int
end

module IncX (M: X) = struct
  let x = M.x + 1
end

(* 
  # module A = struct let x = 0 end
  # A.x
  - : int = 0

  # module B = IncX(A)
  # B.x
  - : int = 1
  
  # module C = IncX(B)
  # C.x 
  - : int = 2
*)

module MakeY (M: X) = struct
  let y = 42
end

(* The structure returned by MakeY has a value named y but 
does not have any value named x. In fact, MakeY completely
ignores its input structure. *)