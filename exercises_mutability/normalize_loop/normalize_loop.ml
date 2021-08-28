let norm v =
  let atr = fun x -> x ** 2. in
  v 
  |> Array.map atr 
  |> Array.fold_left (+.) 0. 
  |> Float.sqrt 

let norm v =
  let nw = norm v in
  for x=0 to (Array.length v - 1) do
    v.(x) <- v.(x) /. nw
  done
  
let vt = [| 1.; 1. |];;
let _ = 
  norm vt