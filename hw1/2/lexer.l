%{
    #include "bison.tab.h"

    extern int yylex();
    extern int yyerror();

%}

%option noinput nooutput nodefault yylineno
%option noyywrap

%% 

"int" | "double"                    {yylval.str = yytext; return DATATYPE;}
"+" | "-" | "*" | "/"               {yylval.str = yytext; return OP;}

[{]							        {return SRT_CB;}
[}]							        {return END_CB;} 

[(]							        {return SRT_P;}
[)]                                 {return END_P;}

"="                     	        {return EQUAL;}
"!" 						        {return END_ST;}
","                     	        {return COMMA;}

[[:digit:]]+(\.[[:digit:]]+)?		{yylval.str = yytext;return NUM;}

[[:alpha:]][[:alnum:]]* 			{yylval.str = yytext;return VAR;}
[[:space:]\t\n]+            		;
.                       			{return *yytext;}

%%

static YY_BUFFER_STATE flex_buffer;

void set_input( const char* input ) {
    yy_delete_buffer( flex_buffer );
    flex_buffer = yy_scan_string( input );
}