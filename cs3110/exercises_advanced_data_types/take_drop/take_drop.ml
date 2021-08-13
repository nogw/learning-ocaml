let rec print_list = function
  | [] -> []
  | h::t -> Printf.printf "%d; " h; print_list t  
let take n l =
  let rec aux a ls =
    match ls with
    | [] -> ls
    | _::t -> 
      if a = n then 
        ls
      else 
        aux (a + 1) t 
  in
    aux 0 l 
let take_reverse n l =
  let rec aux a nl ls =
    match ls with
    | [] -> ls
    | h::t -> 
      if a = n then 
        nl
      else 
        aux (a + 1) (nl @ [h]) t 
  in
    aux 0 [] l 
