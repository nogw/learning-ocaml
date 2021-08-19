(* Module types let us describe groups of related modules. 
The syntax for defining a module type is *)

module type M = sig
  (* declarations *)
end

(* is called a signature. A signature is simply a sequence of declarations. *)

module type Stack = sig
  type 'a stack
  val empty : 'a stack
  val is_empty : 'a stack -> bool
  val push : 'a -> 'a stack -> 'a stack
  val peel : 'a stack -> 'a
  val pop : 'a stack -> 'a stack
end

module type Sig = sig
  val f : int -> int 
end

module M : Sig = struct
  let f x = x + 1
end

module M1 : Sig = struct
  let f x = x
end

module ListStack = struct
  type 'a stack = 'a list
end

module ListStack : Stack = struct
  type 'a stack = 'a list
end