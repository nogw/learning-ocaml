let norm a = 
  let acc = ref 0. in
    for x = 0 to (Array.length a - 1) do
      let atr = fun x -> x ** 2. in
      acc := !acc +. atr a.(x);
    done;
  Float.sqrt !acc

let arr = [|5.; 8.|];;
let _ = 
  norm arr