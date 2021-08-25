let print_list lst = 
  lst 
  |> List.map string_of_int
  |> String.concat "; "
  |> print_string

let rec pow n =
  function
  | 0 -> 1
  | 1 -> n
  | n when n < 0 -> failwith "must be greater than or equal to 0"
  | n -> 
    let y = pow n (n / 2) in
    y * y * (if n mod 2 = 0 then 1 else n)
let sum_cube_odd n = 
  (* List.init n succ  *)
  n
  |> List.filter (fun x -> x mod 2 != 0)
  |> List.map (fun x -> x)

let _ =
  let lst = [1; 2; 3; 4; 5] in
  print_list (sum_cube_odd lst)