%{
    #include<stdio.h>

    #ifdef YYDEBUG
        yydebug = 1;
    #endif
    
    void yyerror ( char const *s );
    int yywrap();
    int yylex( void );
    void set_input( const char* input );
%}

%union {
  char *str;
}

%token <s>  NUM
%token <s>  DATATYPE
%token <s> VAR
%token <s> OP
%token  EQUAL
%token  COMMA

%token  END_ST

%token  SRT_P
%token  END_P
%token  SRT_CB
%token  END_CB

%token  RETURN


%%

PROGRAM             : STATEMENTS                        {  printf("SUCCESS\n"); }                                         
                    
STATEMENTS          : STATEMENT                                                        
                    | STATEMENTS STATEMENT              
                    ;                                   

STATEMENT           : VAR_DECLARE END_ST          
                    | FUNC_DECLARE                      
                    | EXP END_ST                                                
                    | RETURN EXP END_ST           
                    ;

VAR_DECLARE         : DATATYPE VAR
                    | DATATYPE ASSIGNMENT
                    ;

EXP                 : ASSIGNMENT
                    | FUNC_CALL
                    ;
 
ASSIGNMENT          : VAR EQUAL VAL
                    ;

VAL                 : VAR                                                                     
                    | NUM                                
                    | VAR OP VAR                                                         
                    | VAR OP NUM                                                                                           
                    | NUM OP VAR                                                                                            
                    | NUM OP NUM                                                    
                    ;                       
                                           
FUNC_DECLARE        : DATATYPE VAR SRT_P ARGS END_P BLOCK  
                    | DATATYPE VAR SRT_P END_P BLOCK
                    ;           

ARGS                : DATATYPE VAR                                                     
                    | DATATYPE VAR COMMA ARGS
                    ;                   

BLOCK               : SRT_CB STATEMENTS END_CB                          
                    ;

FUNC_CALL           : VAR SRT_P END_P                                                               
                    | VAR SRT_P PARAM_VAL END_P
                    ;               

PARAM_VAL           : VAL                                                              
                    | VAL COMMA PARAM_VAL
                                                                      

%%


int main() {
    char buffer[BUFSIZ];
    while(1) {
        char* input = fgets( buffer, sizeof buffer, stdin );
        if ( buffer == NULL ) break;
        set_input( input );
        yyparse();
        printf("PARSING COMPLETE\n");
    }
   return 0;
}
int yywrap() {
   return 1;
}
void yyerror (char const *s) {
    printf("Error :\n");
    fprintf (stderr, "%s\n", s);
}