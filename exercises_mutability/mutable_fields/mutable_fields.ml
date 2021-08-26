type student = {
  name: string;
  mutable gpa: string;
}

let student = { name = "Alice"; gpa = "3.7" }
(* val student : student = {name = "Alice"; gpa = "3.7"} *)

let _ = student.gpa <- "4.0" 
(* val student : student = {name = "Alice"; gpa = "4.0"} *)