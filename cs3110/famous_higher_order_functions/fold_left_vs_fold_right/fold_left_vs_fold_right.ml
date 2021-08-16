(* Recall that x--y tail-recursively computes the list 
containing all the integers from x to y inclusive *)
let (--) i j =
  let rec from i j l =
    if i > j then 
      l
    else
      from i (j-1) (j::l)
  in
    from i j []

(* you may instead want to reverse the list first then use fold_left; 
the operator will need to take its arguments in the reverse order, too *)

let _ = 
  let lst = [1; 2; 3] in 
    List.fold_right (-) lst 0, 
    (* 1 - (2 - (3 - 0)) *)
    List.fold_left (-) 0 lst, 
    (* ((0 - 1) - 2) - 3 *)
  let lst1 = [1; 2; 3; 4; 5] in 
    List.fold_right (fun x y -> x - y) lst1 0, 
    (* - : int = 2 *)
    List.fold_left (fun y x -> x - y) 0 (List.rev lst1), 
    (* - : int = 2 *)
    List.fold_left (fun x y -> y - x) 0 (List.rev (0--1_000_000)), 
    (* - : int = 500000 *)
    List.fold_right (fun y x -> x - y) (0--1_000_000) 0 
    (* Stack overflow during evaluation (looping recursion?) *)
;;

(* We could even define a tail-recursive version of 
fold_right by baking in the list reversal: *)

let fold_right_tr f l acc =
  List.fold_left (fun a e -> f e a) acc (List.rev l)

(* # fold_right_tr (fun x y -> x - y) (0-1_000_000) 0;;
- : int = 500000*)

(* # ListLabels.fold_left;;
- : f:('a -> 'b -> 'a) -> init:'a -> 'b list -> 'a = <fun>

# ListLabels.fold_right;;
- : f:('a -> 'b -> 'b) -> 'a list -> init:'b -> 'b = <fun>

# ListLabels.fold_left ~f:(fun x y -> x - y) ~init:0 [1;2;3];;
- : int = -6

# ListLabels.fold_right ~f:(fun y x -> x - y) ~init:0 [1;2;3];;
- : int = -6 *)

(* It's possible to write our own version of the fold functions 
that would label the arguments to the combining operator, so we 
don't even have to remember their order:  *)

let rec fold_left ~op:(f: acc: 'a -> elt: 'b -> 'a) ~init:accu l =
  match l with
  | [] -> accu
  | h::t -> fold_left ~op:f ~init:(f ~acc: accu ~elt: h) t

let rec fold_right ~op:(f: elt: 'a -> acc: 'b -> 'b) l ~init: accu = 
  match l with
  | [] -> accu
  | h::t -> f ~elt: h ~acc: (fold_right ~op: f t ~init: accu)

(* 
# fold_left ~op:(+) ~init:0 [1;2;3];;
Error: This expression has type int -> int -> int                                      
but an expression was expected of type acc:'a -> elt:'b -> 'a

The problem is that the built-in (+) operator doesn't have labeled arguments,
so we can't pass it in as the combining operator to our labeled functions. 
We'd have to define our own labeled version of it:
*)

let add ~acc ~elt = acc+elt;;

fold_left ~op: add ~init: 0 [1; 2; 3];;
(* - : int = 6 *)