%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER

%%

start:
      expr '\n'            { printf("Result = %d\n", $1); }
    | start expr '\n'      { printf("Result = %d\n", $2); }
    ;

expr:
      expr '+' expr        { $$ = $1 + $3; }
    | expr '-' expr        { $$ = $1 - $3; }
    | expr '*' expr        { $$ = $1 * $3; }
    | expr '/' expr        {
                              if($3 == 0) {
                                 printf("Error: Division by Zero\n");
                                 exit(1);
                              }
                              $$ = $1 / $3;
                           }
    | '(' expr ')'         { $$ = $2; }
    | NUMBER
    ;

%%

void yyerror(const char *s) {
    printf("Syntax Error: %s\n", s);
}

int main() {
    printf("Enter arithmetic expressions:\n");
    yyparse();
    return 0;
}


