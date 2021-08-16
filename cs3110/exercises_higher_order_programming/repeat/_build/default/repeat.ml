let repeat f x r = 
  let rec aux x r i =
    if i > r then
      x
    else 
      aux (f x) r (i + 1) 
  in
    aux x r 0

let _ = 
  let square x = x * x in
  print_int (repeat square 2 2)