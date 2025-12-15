/* while.l - LEX specification for tokens of while statement */

%{
#include "Assignment5.tab.h"
#include <stdio.h>
%}

%%

"while"             { return WHILE; }
"++"                { return INC; }
"--"                { return DEC; }
"<="|">="|"=="|"!="|"<"|">"    { return RELOP; }

[0-9]+              { yylval = atoi(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }

[ \t\n]+            ;   /* skip spaces */
"("|")"|"{"|"}"|";"|"="|"+"|"-"|"*"|"/"   { return yytext[0]; }

.                   { return yytext[0]; }

%%

int yywrap() { return 1; }
