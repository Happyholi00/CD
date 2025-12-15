%{
#include <stdio.h>
%}

ARTICLE    (a|an|the)
PRONOUN    (I|you|he|she|it|we|they)
VERB       (eat|run|go|play|walk|read|write)
NOUN       (cat|dog|apple|school|book|boy|girl|home|food)
NUMBER     [0-9]+
WORD       [A-Za-z]+

%%

{ARTICLE}      { printf("ARTICLE\t\t: %s\n", yytext); }
{PRONOUN}      { printf("PRONOUN\t\t: %s\n", yytext); }
{VERB}         { printf("VERB\t\t: %s\n", yytext); }
{NOUN}         { printf("NOUN\t\t: %s\n", yytext); }
{NUMBER}       { printf("NUMBER\t\t: %s\n", yytext); }
{WORD}         { printf("WORD\t\t: %s\n", yytext); }
[ \t\n]+       { /* Ignore whitespace */ }
.              { printf("UNKNOWN\t\t: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() { return 1; }

