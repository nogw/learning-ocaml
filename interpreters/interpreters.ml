(* Compilation Phases *)

(* Lexing. During lexing, the compiler transforms the original source 
code of the program from a sequence of characters to a sequence of tokens *)

(* Parsing. During parsing, the compiler transforms the sequence of tokens 
into a tree called the abstract syntax tree (AST). 

The AST typically forgets about concrete details. For example:

- In 1 + (2 + 3) the parentheses group the right-hand addition operation, 
indicating it should be evaluated first. A tree can represent that as follows: 

   +
  / \
  1   +
    / \
    2   3

- indicating it should be evaluated first. A tree can represent that as follows: 

   list
  /  |  \
  1   2   3

- In fun x -> 42, the fun keyword and -> punctuation mark separate the arguments 
and body of the function from the surrounding code. A tree can represent that 
as a node with two children:

  function
  /     \
 x       42

An AST thus represents the structure of a program at a level that is easier 
for the compiler writer to manipulate.
*)

(* Semantic analysis. During semantic analysis, the compiler checks to see 
whether the program is meaningful according to the rules of the language 
that the compiler is implementing

The most common kind of semantic analysis is type checking: 
the compiler analyzes the types of all the expressions that appear in the 
program to see whether there is a type error or not. Type checking typically 
requires producing a data structure called a symbol table that maps identifiers *)

(* Translation to intermediate representation. After semantic analysis, 
a compiler could immediately translate the AST (augmented with symbol tables) 
into the target language. But if the same compiler wanted to produce output for multiple targets (e.g., for x86 and ARM and MIPS) *)

(* Target code generation. The final phase of compilation is to generate target 
code from the IR. This phase typically involves selecting concrete machine instructions 
(such as x86 opcodes), and determining which variables will be stored in memory 
(which is slow to access) vs. processor registers (which are fast to access but 
limited in number). As part of code generation, a compiler therefore attempts to 
optimize the performance of the target code *)

(* Groups of Phases *)

(* The phases of compilation can be grouped into two or three pieces:

  - The front end of the compiler does lexing, parsing, and semantic analysis. 
    It produces an AST and associated symbol tables. It tranforms the AST into an IR.

  - The middle end (if it exists) of the compiler operates on the IR. Usually 
    this involves performing optimizations that are independent of the target language.

  - The back end of the compiler does code generation, including further optimization. *)