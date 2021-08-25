(* Example 1: Producing a Test Suite for Multiple Structures *)
module type StackSig = sig
  type 'a t
  val empty : 'a t
  val push : 'a -> 'a t -> 'a t
  val peek : 'a t -> 'a
end

module ListStack = struct
  type 'a t = 'a list
  let empty = []
  let push x s = x::s
  let peek = function 
  | [] -> failwith "empty" 
  | x::_ -> x 
end 

module MyStack = struct
  type 'a t = Empty | Entry of 'a * 'a t
  let empty = Empty
  let push x s = Entry (x, s)
  let peek = function
  | Empty -> failwith "empty"
  | Entry (x, _) -> x
end

(* Suppose we wanted to write code that would test a ListStack: *)
let _ =
  assert (ListStack.(empty |> push 1 |> peek) = 1);
  assert (MyStack.(empty |> push 1 |> peek) = 1)