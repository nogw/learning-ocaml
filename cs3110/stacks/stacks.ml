module type Stack = sig
  type 'a stack
  val empty : 'a stack
  val is_empty : 'a stack -> bool
  val push : 'a -> 'a stack -> 'a stack
  val peek : 'a stack -> 'a
  val pop : 'a stack -> 'a stack
end

(* Stack Implemented as List *)

module ListStack : Stack = struct
  type 'a stack = 'a list
  let empty = []
  let is_empty s = s = []
  let push x s = x :: s
  let peek = function
  | [] -> failwith "Empty"
  | x::_ -> x
  let pop = function
  | [] -> failwith "Empty"
  | _::xs -> xs
end

(* Stack Implemented as Variant *)

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
  | Entry(_, y) -> y
end