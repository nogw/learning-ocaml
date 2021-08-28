let norm v =
  let atr = fun x -> x ** 2. in
  v 
  |> Array.map atr 
  |> Array.fold_left (+.) 0. 
  |> Float.sqrt

let normalize l = 
  let nw = norm l in
  Array.iteri (fun x y -> l.(x) <- y /. nw) l

let l = [| 1. ; 1. |]

let _ = 
  normalize l