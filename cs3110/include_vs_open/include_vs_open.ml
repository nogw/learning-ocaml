module M = struct
  let x = 0
end

module N = struct
  include M
  let y = x + 1
end

module O = struct
  open M
  let y = x + 1
end

(* 
module M : sig val x : int end
module N : sig val x : int val y : int end
module O : sig val y : int end
*)