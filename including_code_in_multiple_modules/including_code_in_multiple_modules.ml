module type Set = sig
  type 'a t
  val empty : 'a t
  val mem   : 'a -> 'a t -> bool
  val add   : 'a -> 'a t -> 'a t
  val elts  : 'a t -> 'a list
end

module type SetExtended = sig
  include Set
  val of_list : 'a list -> 'a t
end

module ListSetDupsImpl = struct
  type 'a t = 'a list
  let empty = []
  let mem = List.mem
  let add x s = x::s
  let elts s = List.sort_uniq Stdlib.compare s
end

let rec add_all lst set = 
  match lst with
  | [] -> set
  | h::t -> add_all t (add h set)
(* Error: Unbound value add *)

let rec add_all lst set = 
  match lst with
  | [] -> set
  | h::t -> add_all t (ListSetDupsImpl.add h set)
(* Error: Unbound value add *)

let rec add_all' add lst set =
  match lst with
  | [] -> set
  | h::t -> add_all' add t (add h set)

let add_all_dups lst set = add_all' ListSetDupsImpl.add lst set

module AddAll = struct
  let rec add_all'' add lst set = 
  match lst with
  | [] -> []
  | h::t -> add_all'' add t (add h set)
end