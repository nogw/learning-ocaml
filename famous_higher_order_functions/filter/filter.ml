let even n = 
  n mod 2 = 0
let odd n =
  n mod 2 <> 0
let rec evens = function
  | [] -> [] 
  | h::t -> 
      if even h then 
        h::(evens t) 
      else 
        evens t
let rec odds = function
  | [] -> []
  | h::t ->
      if odd h then 
        h::(odds t) 
      else 
        odds t 

let rec filter f = function
  | [] -> []
  | h::t -> 
      if f h then 
        h::(filter f t)
      else 
        filter f t 

let _ = 
  let evens1 = filter even
  and odds1 = filter odd
  and lst = [1; 2; 3; 4] in (
    evens1 lst,
    odds1 lst
  )
