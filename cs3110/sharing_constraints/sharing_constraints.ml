module type Arith = sig
  type t
  val zero : t
  val one : t
  val (+) : t -> t -> t
  val ( * ) : t -> t -> t
  val (~-) : t -> t
end

module Ints = struct
  type t = int
  let zero = 0
  let one = 1
  let (+) = Stdlib.(+)
  let ( * ) = Stdlib.( * )
  let (~-) = Stdlib.(~-)
end

module IntsAbstracted : Arith = Ints
(* IntsAbstracted.(1 + 1) is illegal *)
module IntsExposed : (Arith with type t = int) = Ints
(* IntsExposed.(1 + 1) is legal *)