type 'a node = 
  | Leaf 
  | Node of 'a * 'a node * 'a node

let rec map_tree f t =
  match t with
  | Leaf -> Leaf
  | Node (v, l ,r) -> Node(f(v), map_tree f l, map_tree f r)

let rec print_tree t = 
  match t with
  | Leaf -> "Leaf"
  | Node (v, l, r) -> Format.sprintf "Node(%d, %s, %s)" v (print_tree l) (print_tree r)

let _ =
  let t = 
    Node(3,
      Node(2, Leaf, Leaf),
      Node(1, Leaf, Leaf)
    )
  and square = fun x -> x * 2
  in (
    print_tree t 
      |> print_endline,
    map_tree square t 
      |> print_tree 
      |> print_endline
  )