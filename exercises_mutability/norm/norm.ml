type vector = float array
let norm (v: vector) =
  let atr = fun x -> x ** 2. in
  v 
  |> Array.map atr 
  |> Array.fold_left (+.) 0. 
  |> Float.sqrt
  |> print_float

let _ = 
  let vector = [| 15.; 28.; |] in
  norm vector