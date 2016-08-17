package alexico;
import static alexico.Token.*;
%%
%class Lexer
%type Token
L=[a-b]
D=[0-9]
white=[ ,\n ]
%{
    public String lexema;
%}
%%
{white} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return igual;}
"+" {return suma;}
{L} {lexema=yytext(); return Variable;}
{D} {lexema=yytext(); return Numero;}
"*" {return multiplicacion;}
"-" {return resta;}
"/" {return division;}
.   {return ERROR;}
