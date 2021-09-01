open Ast

let parse (s: string) : expr =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast

let _ =
  let rec loop v = 
    match v with
    | "exit" -> print_endline "\npepe - goodbye :)\n"
    | _ -> 
      (* print_endline v; *)
      (* print_string ">>> "; *)
      let str = read_line () in
      let _ = parse str
      (* loop str *)
  in
    loop ""
    
  (* parse "var x = 3110 in x + x"  *)