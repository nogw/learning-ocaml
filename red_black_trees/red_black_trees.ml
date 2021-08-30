type color = Red | Black

type 'a rbtree = 
  | Leaf 
  | Node of color * 'a * 'a rbtree * 'a rbtree

let rec mem x = function
  | Leaf -> false
  | Node (_, y, l, r) ->
    if x < y then
      mem x l
    else if x > y then
      mem x r
    else
      true

let balance = function
  | Black, z, Node (Red, y, Node (Red, x, a, b), c), d
  | Black, z, Node (Red, x, a, Node (Red, y, b, c)), d
  | Black, x, a, Node (Red, z, Node (Red, y, b, c), d)
  | Black, x, a, Node (Red, y, b, Node (Red, z, c, d)) ->
    Node (Red, y, Node (Black, x, a, b), Node (Black, z, c, d))
  | a, b, c, d -> Node (a, b, c, d)

let insert x s = 
  let rec ins = function
  | Leaf -> Node (Red, x, Leaf, Leaf)
  | Node (color, y, a, b) as s ->
    if x < y then 
      balance (color, y, ins a, b)
    else if x > y then
      balance (color, y, a, ins b)
    else 
      s in
    match ins s with
    | Node (_, y, a, b) -> Node (Black, y, a, b)
    | Leaf -> failwith "RBT insert failed with ins returning leaf"