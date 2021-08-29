let init_matrix x y f =
  let matrix = Array.make x [||] in
  let rec line u = 
    let empty_array = Array.make y 0 in
    let rec column n =
      match n with
      | n when n <= y-1 -> 
        empty_array.(n) <- f n;
        column (n + 1)
      | _ -> empty_array
    in 
      match u with
      | u when u <= x-1 ->
        matrix.(u) <- column 0;
        line (u + 1)
      | _ -> matrix
  in
    line 0

let print_matrix m = 
  m |>
  Array.iter 
    (fun xs -> 
      print_string "[";
      xs |> Array.iter (fun x -> x |> string_of_int |> Printf.printf "%s;");
      print_string "]\n";
    )   

let _ =
  let square = fun x -> x * 10 in
  print_matrix(init_matrix 5 5 square)  