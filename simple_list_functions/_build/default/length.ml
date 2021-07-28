let rec tamanho = function
    | [] -> 0
    | x :: xs -> 1 + tamanho xs
;;

tamanho [1; 2; 4]