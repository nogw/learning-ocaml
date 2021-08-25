type 'a tree = 
  | Leaf
  | Node of 'a * 'a tree * 'a tree

type 'a list =
  | Nil
  | Cons of 'a * 'a list

let rec foldlist init op = 
  function
  | Nil -> init
  | Cons (h, t) -> op h (foldlist init op t)

let rec foldtree init op = 
  function
  | Leaf -> init
  | Node (v, l, r) -> op v (foldtree init op l) (foldtree init op r)

let size t = foldtree 0 (fun _ l r -> 1 + l + r) t
let depth t = foldtree 0 (fun _ l r -> 1 + max l r) t
let preorder t = foldtree [] (fun x l r -> [x] @ l @ r) t