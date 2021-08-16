(* 
# Python
def sum_sq(n):
    sum = 0
    for i in range(0,n):
        sum += i*i
    return sum
*)
(* The equivalent recursive code in OCaml would be *)
let sum_sq n =
  let rec loop i sum = 
    if i > n then 
      sum
    else 
      loop (i+1) (sum + i * i)
  in
    loop 0 0

(* Another, clearer way of producing the same result in OCaml
uses higher-order functions and the pipeline operator *)
let square x = x * x
let sum = List.fold_left (+) 0
let (--) i j =
  let rec from i j l =
    if i > j then
      l
    else 
      from i (j - 1) (j::l)
  in
    from i j []
let sum_sq n = 
  0--n                  (* [0;1;2;...;n]   *)
  |> List.map square    (* [0;1;4;...;n*n] *)
  |> sum                (*  0+1+4+...+n*n  *)

(* worse: a lot of extra let..in syntax *)
let sum_sq n =
  let l = 0--n in
  let sq_l = List.map square l in
  sum sq_l

(* maybe worse:  have to read the function applications from right to left
 * rather than top to bottom *)
let sum_sq n =
  sum (List.map square (0--n))

(* We could improve our code a little further by using List.rev_map instead of 
List.map. List.rev_map is a tail-recursive version of map that reverses the 
order of the list. Since (+) is associative and commutative, we don't mind 
the list being reversed. *)
let sum_sq n =
  0--n
  |> List.rev_map square
  |> sum
