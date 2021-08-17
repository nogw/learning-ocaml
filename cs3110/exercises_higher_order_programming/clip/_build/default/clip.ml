let clip n = 
  if n < 0 then 0 
  else if n > 10 then 10
  else n

let rec print_list = 
  function
  | [] -> []
  | h::t -> Printf.printf "%d ;" h; print_list t 

let maplist f l = 
  let rec aux lst nl = 
    match lst with
    | [] -> nl
    | h::t -> aux t ((f h)::nl); 
  in
    aux l []

let _ =
  let lst = [5; 11; 12; 2; 44; 2; 66; - 29; -50] in (
    print_list(List.rev_map clip lst),
    print_endline "",
    print_list(maplist clip lst)
  )