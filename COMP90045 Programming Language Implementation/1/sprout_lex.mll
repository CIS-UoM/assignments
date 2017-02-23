{
open Sprout_parse
}

let digit = ['0' - '9']
let alpha = ['a' - 'z' 'A' - 'Z']
let alnum = alpha | digit
let digits = digit+
let ident = alpha alnum*
rule token = parse
    [' ' '\t']    { token lexbuf }     (* skip blanks *)
  | '\n'          { Lexing.new_line lexbuf ; token lexbuf }
  | '-'?['0'-'9']+ as lxm { INT_CONST(int_of_string lxm) }
  (* keywords *)
  | "bool" { BOOL }
  | "int" { INT }
  | "true" { BOOL_CONST true }
  | "false" { BOOL_CONST false }
  | "read" { READ }
  | "write" { WRITE }
  | ":=" { ASSIGN }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '=' { EQ }
  | '<' { LT }
  | '+' { PLUS }
  | '-' { MINUS }
  | '*' { MUL }
  | ';' { SEMICOLON }
  | ident as lxm { IDENT lxm }
  | eof { EOF }
