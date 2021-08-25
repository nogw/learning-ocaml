let lenght l =
  List.fold_left (fun a _ -> a + 1) 0 l
let rev l = 
  List.fold_left (fun a x -> x::a) [] l
let map f l =
  List.fold_right (fun x a -> (f x)::a) l []
let filter f l = 
  List.fold_right (fun x a -> if f x then x::a else a) l []