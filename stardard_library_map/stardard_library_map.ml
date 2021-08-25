(* Example: Standard Library Map *)

module type OrderedType = sig
  type t
  val compare : t -> t -> int
end

(* The Map module needs ordering because balanced binary 
trees need to be able to compare keys to determine whether 
one is greater than another. According to the library's 
documentation, compare must satisfy this specification: *)

(* This is a two-argument function [f] such that
 * [f e1 e2] is zero if the keys [e1] and [e2] are equal,
 * [f e1 e2] is strictly negative if [e1] is smaller than [e2],
 * and [f e1 e2] is strictly positive if [e1] is greater than [e2].
 * Example: a suitable ordering function is the generic structural
 * comparison function [Stdlib.compare]. *)

(* The output of Map.Make is a structure whose type is (almost) 
Map.S and supports all the usual operations we would expect from 
a dictionary: *)

module type S = sig
  type key
  type 'a t
  val empty : 'a t
  val mem : key -> 'a t -> bool
  val add : key -> 'a -> 'a t -> 'a t
  val find : key -> 'a t -> 'a
end

(* 
There are two reasons why we say that the output is "almost" that type:

1 - The Map module actually specifies a sharing constraint (which we covered 
in the previous notes): type key = Ord.t. That is, the output of Map.Make 
shares its key type with the type Ord.t. That enables keys to be compared 
with Ord.compare. The way that sharing constraint is specified is in the 
type of Make (which can be found in map.mli, the interface file for the map 
compilation unit):

  module Make : functor (Ord: OrderedType) -> (S with type key = Ord.t) 

2 - The Map module actually specifies something called a variance on the 
representation type, writing +'a t instead of 'a t as we did above. 
We won't concern ourselves with what this means
*)

(* Using the Map Module *)

module IntMap = Map.Make(struct type t = int let compare = Stdlib.compare end)

(* 
  # open IntMap;;

  # let m1 = add 1 "one" empty;;
  val m1 : string t = <abstr>

  # find 1 m1;;
  - : string = "one"

  # mem 42 m1;;
  - : bool = false

  # find 42 m1;;
  Exception: Not_found.

  # bindings m1;;
  - : (int * string) list = [(1, "one")]

  # let m2 = add 1 1. empty;;
  val m2 : float t = <abstr>

  # bindings m2;;
  - : (int * float) list = [(1, 1.)]
  *)

(* If we didn't want to pass an anonymous structure, 
we could instead define a module and pass it: *)

module Int = struct
  type t = Int
  let compare = Stdlib.compare
end

module IntMap = Map.Make(Int)

(* The signature of the structure returned by Map.Make 
records the fact that keys are of type int *)

(* A map for string keys: *)

module StringMap = Map.Make(String)

(* 
  # let m = StringMap.(add "one" 1 empty);;
  # let m' = StringMap.(add "two" 2 m);;
  # StringMap.bindings m';;
  - : (string * int) list = [("one", 1); ("two", 2)] 
  # StringMap.bindings m;;
  - : (string * int) list = [("one", 1)] 
  #
*)

(* A map for record keys. *)

type name = {
  first: string;
  last: string;
}

module Name = struct 
  type t = name
  let compare {first = first1; last = last1}
              {first = first2; last = last2} =
  match Stdlib.compare last1 last2 with
  | 0 -> Stdlib.compare first1 first2
  | c -> c
end

module NameMap = Map.Make(Name)

let k1 = { last = "Kardashian"; first = "Kourtney" }
let k2 = { last = "Kardashian"; first = "Kimberly" }
let k3 = { last = "Kardashian"; first = "Khloe" }
let k4 = { last = "West"; first = "Kanye" }

let nm = NameMap.(
  empty |> add k1 1979 |> add k2 1980
        |> add k3 1984 |> add k4 1977
)

let lst = NameMap.bindings nm

(* 
the value of lst will be

[({first = "Khloe"; last = "Kardashian"}, 1984);
 ({first = "Kimberly"; last = "Kardashian"}, 1980);
 ({first = "Kourtney"; last = "Kardashian"}, 1979);
 ({first = "Kanye"; last = "West"}, 1977)]
*)