%{
    #include <stdio.h>
    #include "mywork.h"
//    int yylex(void);
//    void yyerror(char *);


%}

%union { 
    float floatval;   // 数值
}

%token ADD SUB MUL DIV ENDLINE LBR RBR
%left ADD SUB
%left MUL DIV

%token <floatval> FLOAT
%type <floatval> expr

%%
program:
        program expr ENDLINE       { printf("%.3f\n",$2); }
        |
        ;
expr:   FLOAT 
        | expr ADD expr         { $$ = $1 + $3; }
        | expr SUB expr         { $$ = $1 - $3; }
        | expr MUL expr         { $$ = $1 * $3; }
        | expr DIV expr         { $$ = $1 / $3; }
        | LBR expr RBR          { $$ = $2; }
        ;
%%
int main(void) {
    yyparse();
    return 0;
}
