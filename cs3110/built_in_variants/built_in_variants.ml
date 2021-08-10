(* [] = Nil and :: = Cons *)
type 'a list = [] | :: of 'a * 'a list
(* Nil = [] and Cons = :: *)
type 'b list = Nil | Cons of 'b * 'b list

(* So option is really just a type constructor, 
with (value) constructors None and Some. 
You can see both list and option *)
type 'c option = None | Some of 'c