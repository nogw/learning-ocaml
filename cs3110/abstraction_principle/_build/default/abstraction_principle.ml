let apply f x = f x

let double v = v * 2 
let pipeline x f = f x
let (|>) = pipeline
let x = 5 |> double

let _ = print_int x