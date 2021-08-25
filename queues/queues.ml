module type Queue = sig
  type 'a queue 
  val empty : 'a queue
  val is_empty : 'a queue -> bool
  val enqueue : 'a -> 'a queue -> 'a queue 
  val peek : 'a queue -> 'a option
  val dequeue : 'a queue -> 'a queue option
end

(* Queue Implemented as a List *)

module ListQueue: Queue = struct
  type 'a queue = 'a list
  let empty = []
  let is_empty q = q = []
  let enqueue x q = q @ [x]
  let peek = function
  | [] -> None
  | x::_ -> Some x
  let dequeue = function
  | [] -> None
  | _::q -> Some q
end

(* Queue Implemented with Two Lists *)

module TwoListQueue : Queue = struct
  type 'a queue = {
    front: 'a list;
    back: 'a list
  }
  let empty = { front = []; back = [] }
  let is_empty = function
  | { front = []; back = [] } -> true
  | _ -> false
  let norm = function
  | { front = []; back } -> { front = List.rev back; back = [] }
  | q -> q
  let enqueue x q = norm { q with back = x::q.back }
  let peek = function
  | { front = []; _ } -> None
  | { front=x::_ ; _} -> Some x
  let dequeue = function
  | { front = []; _ } -> None
  | { front=_::xs; back } -> Some (norm { front=xs; back })
end