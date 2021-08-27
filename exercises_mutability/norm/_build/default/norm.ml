type vector = float array
let norm (v: vector) =
  let atr = fun x -> (x -. Float.sqrt(x)) ** 2. in
  v 
  |> Array.map atr 
  |> Array.fold_left (+.) 0. 
  |> print_float

let _ = 
  let vector = [| 1.; 5.; |] in
  norm vector