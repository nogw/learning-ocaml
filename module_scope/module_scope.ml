module M = struct
  let x = 42
end

let n = M.x
(* 42 *)

open M
let y = x;;
(* 42 *)

(* Opening a module is like writing a local 
definition for each name defined in the module. *)
let lenght = String.length
let get = String.get
let lowercase_ascii = String.lowercase_ascii

(* If there are types, exceptions, or modules defined 
in a module, those also are brought into scope with 
open. For example, if we're given this module: *)

module M = struct
  let x = 42
  type t = bool
  exception E

  module N = struct
    let y = 0
  end
end

(* then open M would have an effect similar to the following: *)

let x = M.x
type t = M.t
type exn += E = M.E
module N = M.N

(* opening a module in a limited scope *)

module M = struct let x = 32 end
module M = struct let x = "32" end

open M 
open N 
let y = x;;
(* : - string = "32" *)

(* without open *)
let f x =
  let y = List.filter ((>) 0) x in
  y

(* with open *)
let f x = 
  let open List in
  let y = filter ((>) 0) x in
  y

(* There is a syntactic sugar for the above: M.(e). Again, 
inside e all the names from M are in scope. This is useful 
for briefly using M in a short expression: *)

let s = "BigRed "
let s' = s |> String.trim |> String.lowercase_ascii (* long way *)
let s' = String.(s |> trim |> lowercase_ascii) (* shorter way *)