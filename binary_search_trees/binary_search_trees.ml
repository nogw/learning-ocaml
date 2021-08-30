type 'a tree = 
  | Node of 'a * 'a tree * 'a tree 
  | Leaf

(** [mem x t] is [true] if [x] is a member of [t]. *)
let rec mem x = function
  | Leaf -> false
  | Node (y, l, r) ->
    if x < y then 
      mem x l 
    else if x > y then 
      mem x r
    else
      true

(** [insert x t] is [t] . *)  
let rec insert x = function
  | Leaf -> Node (x, Leaf, Leaf)
  | Node (y, l, r) as t ->
    if x < y then
      Node (y, insert x l, r)
    else if x > y then 
      Node (y, l, insert x r)
    else
      t