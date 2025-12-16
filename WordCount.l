%{
#include <stdio.h>

int l = 0, w = 0, c = 0;
%}

%%

\n            { l++; c++; }          /* Count newline */
[ \t]+        { c += yyleng; }       /* Count spaces & tabs */
[^ \t\n]+     { w++; c += yyleng; }  /* Count words & characters */

%%

int main(void)
{
    printf("Enter text (Ctrl+Z then Enter to stop on Windows):\n");
    yylex();

    printf("\nLines = %d\n", l);
    printf("Words = %d\n", w);
    printf("Characters = %d\n", c);

    return 0;
}

int yywrap(void)
{
    return 1;
}
