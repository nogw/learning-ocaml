module type Set = sig
  type 'a t
  val empty : 'a t
  val mem   : 'a -> 'a t -> bool
  val add   : 'a -> 'a t -> 'a t
  val elts  : 'a t -> 'a list
end

module ListSetDups : Set = struct
  type 'a t   = 'a list
  let empty   = []
  let mem     = List.mem
  let add x s = x::s
  let elts s  = List.sort_uniq Stdlib.compare s
end

(* Including a structure is like writing a local definition 
for each name defined in the module. Writing include ListSetDups
as we did above, for example, has an effect similar to writing 
exactly the following: *)

module ListSetDupsExtended = struct
  type 'a t = 'a ListSetDups.t
  let empty = ListSetDups.empty
  let mem = ListSetDups.mem
  let add = ListSetDups.add
  let elts = ListSetDups.elts
end

(* Including a signature *)

module type SetExtended = sig
  include Set  
  val of_list : 'a list -> 'a t
end