let d = [("retangle", 4); ("triangle", 3); ("dodecagon", 12)];;

let insert k v d = (k, v)::d

let rec lookup k = function
  | [] -> None
  | (k', v)::t -> if k = k' then Some v else lookup k t 

let _ = 
  lookup "retangle" d
;;