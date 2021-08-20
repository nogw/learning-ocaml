module type Set = sig
  type 'a t
  val empty : 'a t
  val mem   : 'a -> 'a t -> bool
  val add   : 'a -> 'a t -> 'a t
  val elts  : 'a t -> 'a list
end

module ListSetDups : Set = struct
  type 'a t = 'a list
  let empty = []
  let mem = List.mem
  let add x s = x::s
  let elts s = List.sort_uniq Stdlib.compare s
end

module ListSetDupsExtented = struct
  include ListSetDups
  let of_list lst = List.fold_right add lst empty
  let elts set = 
    let rec aux xs set =
      match set with 
      | [] -> xs
      | head :: tail ->
        if mem head xs then 
          aux xs tail
        else 
          aux (head :: xs) tail
    in aux empty set
end