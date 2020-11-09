%{
    extern int yylex();
%}

%%
"<html>"                { printf( "tag_opening: HTML\n" ); }
"</html>"               { printf( "tag_closing: HTML\n" ); }

"<head>"                { printf( "tag_opening: HEAD\n" ); }
"</head>"               { printf( "tag_closing: HEAD\n" ); }

"<body>"                { printf( "tag_opening: BODY\n" ); }
"</body>"               { printf( "tag_closing: BODY\n" ); }

"<h"[1-6]+[^>]*>        { printf( "tag_opening: HEADER" ); }
"</h"[1-6]+[^>]*>       { printf( "tag_closing: HEADER" ); }

"<p>"                   { printf( "tag_opening: PARAGRAPH\n" ); }
"</p>"                  { printf( "tag_closing: PARAGRAPH\n" ); }

"<br>"                  { printf( "tag: NEWLINE\n" ); }

"<a"[^>]*>              { printf( "tag_opening: ANCHOR\n"); }
"</a>"                  { printf( "tag_closing: ANCHOR\n"); }

"<tt>"                  { printf( "tag_opening: TELETYPE\n" ); }
"</tt>"                 { printf( "tag_closing: TELETYPE\n" ); }

[^<]*                   { printf( "text\n" ); }
.                       { printf( "invalid\n" ); exit( 1 ); }
%%

int main( int argc, char** argv ) {
    while( yylex() );
}