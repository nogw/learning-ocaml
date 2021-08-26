let x = ref false
(* val x : bool ref = {contents = false} *)
let y = ref [1; 2; 3] 
(* val y : int list ref = {contents = [1; 2; 3]} *)
let z = [ref 1; ref 2; ref 3]
(* val z : int ref list = [{contents = 1}; {contents = 2}; {contents = 3}] *)