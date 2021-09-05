Adicione pares (ou seja, tuplas com exatamente dois componentes) ao SimPL.
Comece com o interpretador SimPL básico

Exercise: pair parsing [✭✭✭]

Implementar lexing e análise de pares. Suponha que os parênteses ao redor
o par é obrigatório (não opcional, pois às vezes é em OCaml).
Siga esta estratégia:

- [x] Adicione um construtor para pares ao tipo expr.
- [x] Adicione um token de vírgula ao PARSER.
- [x] Implemente LEXING o token de vírgula.
- [ ] Implementar PARSING de pares.

Ao compilar, você obterá alguns avisos de correspondência de padrão inesgotáveis, 
porque ainda não implementou a verificação de tipo nem a interpretação de pares. 
Mas você ainda pode tentar analisá-los no utop com a função parse