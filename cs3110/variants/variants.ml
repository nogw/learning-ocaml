type day = 
  | Sun
  | Mon 
  | Tue 
  | Wed 
  | Thu 
  | Fri 
  | Sat

let int_of_day d = 
  match d with
  | Sun -> 1
  | Mon -> 2
  | Tue -> 3
  | Wed -> 4
  | Thu -> 5
  | Fri -> 6
  | Sat -> 7

let _ = 
  print_int (int_of_day Wed)
;;