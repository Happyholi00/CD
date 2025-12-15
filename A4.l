%{
#include "A4.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[\n]        { return '\n'; }
[ \t]+      { /* ignore whitespace */ }

"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"("         { return '('; }
")"         { return ')'; }

.           { return yytext[0]; }

%%

int yywrap() { return 1; }

