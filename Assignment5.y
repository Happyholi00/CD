%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

/* tokens from lexer */
%token WHILE ID NUM RELOP INC DEC

%left '+' '-'
%left '*' '/'
%left RELOP

%%

stmt:
      WHILE '(' cond ')' body   { printf("Valid while statement.\n"); }
    ;

cond:
      ID RELOP ID
    | ID RELOP NUM
    | NUM RELOP ID
    | NUM RELOP NUM
    ;

body:
      ID '=' expr ';'
    | '{' stmt_list '}'
    | ID INC ';'
    | ID DEC ';'
    ;

stmt_list:
      stmt_list stmt
    | stmt
    ;

expr:
      expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | ID
    | NUM
    ;

%%

void yyerror(const char *s) {
    printf("Invalid while statement.\n");
}

int main() {
    printf("Enter a while statement:\n");
    yyparse();
    return 0;
}
