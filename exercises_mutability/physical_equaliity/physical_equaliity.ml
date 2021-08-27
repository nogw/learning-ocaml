let x = ref 0
let y = x
let z = ref 0

let _ =
  x == y;; (* true *)
  x == z;; (* false *)
  x = y;;  (* true *)
  x = z;;  (* true *)
  x := 1;; (* unit *)
  x = y;;  (* true *)
  x = z;;  (* false *)