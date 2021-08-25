module type Set = sig
  type 'a t
  val empty : 'a t
  val mem : 'a -> 'a t -> bool
  val add : 'a -> 'a t -> 'a t
  val elts : 'a t -> 'a list
end

(* implementation *)

module ListSetNoDups: Set = struct
  type 'a  t = 'a list
  let empty = []
  let mem = List.mem
  let add x s = if mem x s then s else x :: s
  let elts s = s
end

(* second implementation, which 
permits duplicates in the list *)

module ListSetDups : Set = struct
  type 'a t = 'a list
  let empty = []
  let mem = List.mem
  let add x s = x::s
  let elts s = List.sort_uniq Stdlib.compare s
end