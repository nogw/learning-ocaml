(* Lexing with Ocamllex *)

{
  open Parser
}

(* Here, we've opened the Parser module, which is the code in 
parser.ml that was produced by Menhir out of parser.mly. The 
reason we open it is so that we can use the token names declared 
in it, e.g., TRUE, LET, and INT, inside our lexer definition. 
Otherwise, we'd have to write Parser.TRUE, etc. *)

(* Identifiers. The next section of the lexer definition contains 
identifiers, which are named regular expressions. These will be 
used in the rules section, next. *)

let white  = [' ' '\t']+
let digit  = ['0' - '9']
let int    = '-' ? digit+
let letter = ['a' - 'z' 'A' - 'Z'] 
let id     = letter+

(* The identifiers section actually isn't required; 
instead of writing white in the rules we could just directly write 
the regular expression for it. But the identifiers help make the 
lexer definition more self-documenting. *)

(* Rules. The rules section of a lexer definition is written 
in a notation that also resembles BNF *)

(* Here, rule and parse are keywords. The lexer that is generated 
will attempt to match against regular expressions in the order they 
are listed. When a regular expression matches, the lexer produces the 
token specified by its action. *)

rule read = 
  parse
  | white { read lexbuf }
  | "true" { TRUE }
  | "false" { FALSE }
  | "<=" { LEQ }
  | "*" { TIMES }
  | "+" { PLUS }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | "var" { LET }
  | "=" { EQUALS }
  | "in" { IN }
  | "if" { IF }
  | "then" { THEN }
  | "else" { ELSE }
  | id { ID (Lexing.lexeme lexbuf) }
  | int { INT (int_of_string (Lexing.lexeme lexbuf)) }
  | eof { EOF }

(* The first, white { read lexbuf }, means that if whitespace is matched, 
instead of returning a token the lexer should just call the read rule 
again and return whatever token results. In other words, whitespace will be skipped. *)

(* The two for ids and ints use the expression Lexing.lexeme lexbuf. 
This calls a function lexeme defined in the Lexing module, and returns 
the string that matched the regular expression. For example, in the id 
rule, it would return the sequence of upper and lower case letters that 
form the variable name. *)

(* The eof regular expression is a special one that matches the end of the 
file (or string) being lexed *)