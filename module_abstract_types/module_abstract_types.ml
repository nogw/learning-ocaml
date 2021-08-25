module type Stack = sig
  type 'a stack
  val empty : 'a stack
  val is_empty : 'a stack -> bool
  val push : 'a -> 'a stack -> 'a stack
  val peek : 'a stack -> 'a
  val pop : 'a stack -> 'a stack
end

module MyStack : Stack = struct
  type 'a stack =
  | Empty
  | Entry of 'a * 'a stack

  let empty = Empty
  let is_empty s = s = Empty
  let push x s = Entry (x, s)
  let peek = function
  | Empty -> failwith "Empty"
  | Entry(x, _) -> x
  let pop = function
  | Empty -> failwith "Empty"
  | Entry(_, s) -> s
end

(* 
in utop:

# MyStack.push 1 MyStack.empty;;
- : int MyStack.stack = <abstr>
*)

module type Stack = sig
  type 'a t
  val empty : 'a t
  val is_empty : 'a t -> bool
  val push : 'a -> 'a t -> 'a t
  val peek : 'a t -> 'a
  val pop : 'a t -> 'a t
end

(* 
# MyStack.push 1 MyStack.empty;;
- : int MyStack.t = <abstr>
*)
