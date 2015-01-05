%{
    #include "y.tab.h"
    #include <stdlib.h>
    #include <stdio.h>
    #include <math.h>
    //void yyerror(char *);
%}
DIGIT [0-9]
%%

{DIGIT}+"."?{DIGIT}*  { 
    yylval.floatval= atof(yytext);
    return FLOAT;
}


"+"   { return ADD; }
"-"   { return SUB; }
"*"   { return MUL; }
"/"   { return DIV; }
"\n"  { return ENDLINE; }
"("   { return LBR; }
")"   { return RBR; }
[ \t]       ;       /* skip whitespace */
.           yyerror("Unknown character");
%%
