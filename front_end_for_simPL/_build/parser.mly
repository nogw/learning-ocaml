(* Header. The header appears between %{ and %}. It is code that will be copied 
literally into the generated parser.ml. Here we use it just to open the Ast 
module so that, later on in the grammar definition, we can write expressions 
like Int i instead of Ast.Int i. If we wanted we could also define some OCaml 
functions in the header. *)

%{
  open Ast
%}

(* Declarations. The declarations section begins by saying what the lexical tokens 
of the language are. Here are the token declarations for SimPL: *)

%token <int> INT
%token <string> ID
%token TRUE
%token FALSE
%token LEQ
%token TIMES
%token PLUS
%token LPAREN
%token RPAREN
%token LET
%token EQUALS
%token IN
%token IF
%token THEN
%token ELSE
%token COMMA
%token EOF

(* Each of these is just a descriptive name for the token. 
Nothing so far says that LPAREN really corresponds to (, for example. 
We'll take care of that when we define the lexer.*)

(* The EOF token is a special end-of-file token that the lexer will 
return when it comes to the end of the character stream. At that point 
we know the complete program has been read. *)

(* The tokens that have a <type> annotation appearing in them are 
declaring that they will carry some additional data along with them. 
In the case of INT, that's an OCaml int. In the case of ID, that's an OCaml string. *)

(* After declaring the tokens, we have to provide some additional information 
about precedence and associativity. The following declarations say that PLUS 
is left associative, IN is not associative, and PLUS has higher precedence 
than IN (because PLUS appears on a line after IN). *)

%nonassoc IN
%nonassoc ELSE
%left LEQ
%left PLUS
%left TIMES

(* Because PLUS is left associative, 1 + 2 + 3 will parse as (1 + 2) + 3 
and not as 1 + (2 + 3). Because PLUS has higher precedence than IN, the 
expression let x = 1 in x + 2 will parse as let x = 1 in (x + 2) and not 
as (let x = 1 in x) + 2. The other declarations have similar effects. *)

(* After declaring associativity and precedence, we need to declare what 
the starting point is for parsing the language. The following declaration 
says to start with a rule (defined below) named prog. The declaration 
also says that parsing a prog will return an OCaml value of type Ast.expr. *)

(* Rules. The rules section contains production rules that resemble BNF, 
although where in BNF we would write "::=" these rules simply write ":". 
The format of a rule is *)

%start <Ast.expr> prog

%%

prog:
  | e = expr; EOF { e }
  ;

expr:
  | i = INT { Int i }
  | x = ID { Var x }
  | TRUE { Bool true }
  | FALSE { Bool false }
  | e1 = expr; LEQ; e2 = expr { Binop (Leq, e1, e2) }
  | e1 = expr; TIMES; e2 = expr { Binop (Mult, e1, e2) }
  | e1 = expr; PLUS; e2 = expr { Binop (Add, e1, e2) }
  | LET; 
    x = ID; 
    EQUALS;
    e1 = expr;
    IN;
    e2 = expr { Let (x, e1, e2) }
  | IF; e1 = expr; THEN; e2 = expr; ELSE; e3 = expr { If (e1, e2, e3) }
  | LPAREN; e=expr; RPAREN {e}
  | LPAREN; e1 = expr; COMMA; e2 = expr; RPAREN { Pairs (e1, e2) }
  ;

(*The first production, i = INT, says to match an INT token, 
bind the resulting OCaml int value to i, and return AST node Int i.*)

(* The second production, x = ID, says to match an ID token, 
bind the resulting OCaml string value to x, and return AST node Var x. *)

(* The third and fourth productions match a TRUE or FALSE 
token and return the corresponding AST node. *)

(* The fifth, sixth, and seventh productions handle binary operators. 
For example, e1 = expr; PLUS; e2 = expr says to match an expr followed 
by a PLUS token followed by another expr. The first expr is bound to 
e1 and the second to e2. The AST node returned is Binop (Add, e1, e2).*)

(* The eighth production, LET; x = ID; EQUALS; e1 = expr; IN; e2 = expr, 
says to match a LET token followed by an ID token followed by an EQUALS 
token followed by an expr followed by an IN token followed by another expr. 
The string carried by the ID is bound to x, and the two expressions are 
bound to e1 and e2. The AST node returned is Let (x, e1, e2).*)

(* The last production, LPAREN; e = expr; RPAREN says to match an LPAREN 
token followed by an expr followed by an RPAREN. The expression is bound 
to e and returned. *)

(* The final production might be surprising, because it was not included 
in the BNF we wrote for SimPL. That BNF was intended to describe the 
abstract syntax of the language, so it did not include the concrete 
details of how expressions can be grouped with parentheses. But the grammer
definition we've been writing does have to describe the concrete syntax, 
including details like parentheses.

There can also be a trailer section after the rules, which like the header 
is OCaml code that is copied directly into the output parser.ml file. *)