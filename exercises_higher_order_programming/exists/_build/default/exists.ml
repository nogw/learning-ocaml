let rec exists v l = 
  match l with
  | [] -> false
  | h::t ->
    if v h then
      true
    else 
      exists v t 
let exists_fold predicate xs = List.fold_left (fun found x -> found || predicate(x)) false xs 
let exists_lib = List.exists

let _ = 
  let f n = n >= 10 in
  let l = [1; 2; 3; 4; 5; 10] in
  print_string (string_of_bool(exists_lib f l)) 
