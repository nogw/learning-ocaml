module type Set = sig
  type 'a t
  val empty : 'a t
  val mem   : 'a -> 'a t -> bool
  val add   : 'a -> 'a t -> 'a t
  val elts  : 'a t -> 'a list
end

module ListSetDupsImpl = struct
  type 'a t = 'a list
  let empty = []
  let mem = List.mem
  let add x s = x::s
  let elts s = List.sort_uniq Stdlib.compare s
end

module ListSetDups : Set = ListSetDupsImpl

module ListSetDupsExtended = struct
  include ListSetDupsImpl
  let of_list lst = lst
end