type point = float * float
type vector = float list
type matrix = float list list 

let getx: point -> float =
  fun (x,_) -> x

let pt: point = (1., 2.)
let floatpair: float * float = (1., 3.)

let one = getx pt |> print_float
let one' = getx floatpair |> print_float