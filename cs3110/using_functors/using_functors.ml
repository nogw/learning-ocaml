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

(* We can write a functor that is parameterized on the stack implementation, 
and produces the test for that implementation:*)

module StackTester (S: StackSig) = struct
  assert (S.(empty |> push 1 |> peek) = 1)
end

module MyStackTester = StackTester(MyStack)
module ListStackTester = StackTester(ListStack)

(* Example 2: Adding a Function to Multiple Structures *)

module type Set = sig
  type 'a t
  val empty : 'a t
  val mem   : 'a -> 'a t -> bool
  val add   : 'a -> 'a t -> 'a t
  val elts  : 'a t -> 'a list
end

module AddAll (S: Set) = struct
  let add_all lst set = 
    let add' s x = S.add x s in
    List.fold_left add' set lst
end

(* When we apply AddAll to our set implementations, 
we get structures containing an add_all function 
for each implementation:*)

(* 
# module AddAllListSetDups = AddAll(ListSetDups);;
  module AddAllListSetDups : 
    sig
      val add_all : 'a list -> 'a ListSetDups.t -> 'a ListSetDups.t               
    end

# module AddAllListSetNoDups = AddAll(ListSetNoDups);;
  module AddAllListSetNoDups : 
    sig
      val add_all : 'a list -> 'a ListSetNoDups.t -> 'a ListSetNoDups.t               
    end
*)

module ExtendSet (S: Set) = struct
  include S
  let add_all lst set = 
    let add' s x = S.add x s in
    List.fold_left add' set lst
end

(* When we apply the functor, we get a very nice set data structure as a result: *)

(* 
# module ListSetNoDupsExtended = ExtendSet(ListSetNoDups);;
  module ListSetNoDupsExtended :
    sig 
      type 'a t = 'a ListSetNoDups.t                                      
      val empty : 'a t
      val mem : 'a -> 'a t -> bool
      val add : 'a -> 'a t -> 'a t
      val elts : 'a t -> 'a list
      val add_all : 'a list -> 'a t -> 'a t
    end
*)