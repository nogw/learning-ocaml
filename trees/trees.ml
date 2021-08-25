type 'a tree = 
  | Leaf
  | Node of 'a * 'a tree * 'a tree

(* notice how similar their structure is *)
type 'a mylist = 
  | Nil
  | Cons of 'a * 'a mylist

(* the code below constructs this tree:
         4
       /   \
      2     5
     / \   / \
    1   3 6   7 
*)

let t = 
  Node(4,
    Node(2,
      Node(1, Leaf, Leaf),
      Node(3, Leaf, Leaf)
    ),
    Node(5,
      Node(6, Leaf, Leaf),
      Node(7, Leaf, Leaf)
    )
  )

(* The size of a tree is the number of nodes in it *)
(* that returns the number of nodes in a tree: *)
let rec size_of_tree = function
  | Leaf -> 0
  | Node (_, l, r) -> 1 + size_of_tree l + size_of_tree r 

(* representation with Records *)
type 'a tree = 
  | Leaf
  | Node of 'a node

and 'a node = {
  value: 'a;
  left: 'a tree;
  right: 'a tree
}

(* represents
      2
     / \ 
    1   3  *)

let t = 
  Node {
    value = 2;
    left = Node { value = 1; left = Leaf; right = Leaf };
    right = Node { value = 3; left = Leaf; right = Leaf }
  }

(* We can use pattern matching to write the usual algorithms for 
recursively traversing trees. For example, 
here is a recursive search over the tree *)

(* [mem x t] returns [true] if and only if [x] is a value at some
 * node in tree [t]. 
 *)

let rec mem x = function
  | Leaf -> false
  | Node { value; left; right } -> value = x || mem x left || mem x right 

(* Here's a function that computes the preorder traversal of a tree, in which
 each node is visited before any of its children, by constructing 
 a list in which the values occur in the order in which they would be visited: *)

let rec preorder = function
  | Leaf -> []
  | Node { value; left; right } -> [value] @ preorder left @ preorder right   

let preorder_lin t = 
  let rec pre_acc acc = function
    | Leaf -> acc
    | Node {value; left; right} -> value :: (pre_acc (pre_acc acc right) left)
  in
    pre_acc [] t 