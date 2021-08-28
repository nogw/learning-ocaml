(* let normalize a = 
  Array.iteri (fun x y -> y.(x) <- 0.7) a

let _ = 
  let lst = [| 1.; 2. |] in
  normalize lst *)

let _ = 
let l = [| 1. ; 2. ; 3. |] in
Array.iteri (fun x y -> l.(x) <- y) l