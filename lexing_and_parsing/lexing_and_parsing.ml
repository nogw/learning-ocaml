(* Lexers *)

(* lexer generator is a collection of regular expressions that describe 
the tokens of the language. The output is an automaton implemented in a 
high-level language, such as C (for lex) or OCaml (for ocamllex).*)

(* That automaton itself takes files (or strings) as input, 
and each character of the file becomes an input to the automaton. 
Eventually the automaton either recognizes the sequence of characters 
it has received as a valid token in the language, in which case the 
automaton produces an output of that token and resets itself to
being recognizing the next token, or rejects the sequence of 
characters as an invalid token. *)

(* Parsers *)

(* Parser generators such as yacc and menhir are similarly 
built on the theory of automata They are like finite automata
except they also maintain a stack onto which they can push and pop symbols. 
The stack enables them to accept a bigger class of languages *)