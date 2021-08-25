module type Dictionary = sig
  type ('k, 'v) t
  val empty : ('k, 'v) t
  val insert : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t
  val lookup : 'k -> ('k, 'v) t -> 'v
end

(* implementing *)

module AssocListDict: Dictionary = struct
  type ('k, 'v) t = ('k * 'v ) list
  let empty = []
  let insert k v d = (k, v)::d
  let lookup k d = List.assoc k d
end

(* utop *)
(* 
# #use "dict.ml";;
# open AssocListDict;;
# let d = insert 1 "one" empty;;

val d : (int * string) list = [(1, "one")]
*)