/* ocamlyacc parser for bean */
%{
open Sprout_ast
%}

%token <bool> BOOL_CONST
%token <int> INT_CONST
%token <string> IDENT
%token BOOL INT
%token WRITE READ
%token ASSIGN
%token LPAREN RPAREN
%token EQ LT
%token PLUS MINUS MUL
%token SEMICOLON
%token EOF

%nonassoc EQ LT
%left PLUS MINUS
%left MUL
%nonassoc UMINUS

%type <Sprout_ast.program> program

%start program
%%

program:
  decls stmts { { decls = List.rev $1 ; stmts = List.rev $2 } }

decl :
  | typespec IDENT SEMICOLON { ($2, $1) }

decls :
  | decls decl { $2 :: $1 }
  | { [] }

typespec :
  | BOOL { Bool }
  | INT { Int }

/* Builds stmts in reverse order */
stmts:
  | stmts stmt { $2 :: $1 }
  | { [] }

stmt :
  stmt_body SEMICOLON { $1 }

stmt_body:
  | READ lvalue { Read $2 }
  | WRITE expr { Write $2 }
  | lvalue ASSIGN rvalue { Assign ($1, $3) }

rvalue :
  | expr { Rexpr $1 }

lvalue:
  | IDENT { LId $1 }

expr:
  | BOOL_CONST { Ebool $1 }
  | INT_CONST { Eint $1 }
  | lvalue { Elval $1 }
  /* Binary operators */
  | expr PLUS expr { Ebinop ($1, Op_add, $3) }
  | expr MINUS expr { Ebinop ($1, Op_sub, $3) }
  | expr MUL expr { Ebinop ($1, Op_mul, $3) }
  | expr EQ expr { Ebinop ($1, Op_eq, $3) }
  | expr LT expr { Ebinop ($1, Op_lt, $3) }
  | MINUS expr %prec UMINUS { Eunop (Op_minus, $2) }
  | LPAREN expr RPAREN { $2 }
