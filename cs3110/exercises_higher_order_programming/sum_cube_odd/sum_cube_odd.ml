let rec pow n =
  function
  | 0 -> 1
  | 1 -> n
  | n when n < 0 -> failwith "must be greater than or equal to 0"
  | n -> 
    let y = pow n (n / 2) in
    y * y * (if n mod 2 = 0 then 1 else n)
let sum_cube_odd n = 
  List.init n succ 
  |> List.filter (fun x -> x mod 2 != 0)
  |> List.map (fun x -> pow x 3)
  |> List.fold_left (+) 0