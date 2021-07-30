let rec tamanho = function
  | [] -> 0
  | _::xs -> 1 + tamanho xs
;;