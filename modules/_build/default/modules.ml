module Operations = struct
  let sum a b = 
    a + b
  ;;
  let minus a b =
    a - b
  ;;
  let mult a b =
    a * b
  ;;

  let div a b =
    a / b
  ;;
end

let _ = 
  let a = int_of_string Sys.argv.(1) 
  and b = int_of_string Sys.argv.(2) in
  Printf.printf "sum: %d\n" (Operations.sum a b); 
  Printf.printf "minus: %d\n" (Operations.minus a b);
  Printf.printf "multiplication: %d\n" (Operations.mult a b); 
  Printf.printf "division: %d\n" (Operations.div a b); 
;;