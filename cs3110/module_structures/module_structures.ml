(* module definions that have the following syntax *)

module M = struct
  
end

(* for example, is a module for stacks implemented as lists *)

module ListStack = struct
  let empty = []
  let is_empty s = (s = [])
  let push x s = x :: s
  let peek = function
  | [] -> failwith "Empty"
  | h::_ -> h
  let pop = function
  | [] -> failwith "Empty"
  | _::t -> t  
end

(* Module names must begin with an uppercase letter. 
The part of the module definition that is written *)

(* 
  struct
    (* definitions *)
  end 
*)