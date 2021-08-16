let repeat f x r = 
  let rec aux i acc =
    if i < r then
      aux (i + 1) (f acc);
  in
    aux 0 x 

let _ = 
  let square x = x * x in
  repeat square 2 5