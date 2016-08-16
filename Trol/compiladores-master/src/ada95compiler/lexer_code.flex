package ada95compiler;
%%
%class Lexer
%unicode
%int
%line
%column

digit = [0-9]
white = [ ]
enter = \r|\n|\r\n
char = [a-zA-Z]
especialSymbol = "_"|"-"
abort = "abort"
and = "and"
case = "case"
digits = "digits"
exception = "exception"
goto = "goto"
loop = "loop"
of = "of"
record = "record"
select = "select"
then = "then"
with = "with"
abs = "abs"
array = "array"
constant = "constant"
do = "do"
exit = "exit"
if = "if"
mod = "mod"
or = "or"
private = "private"
rem = "rem"
separate = "separate"
type = "type"
xor = "xor"
accept = "accept"
at = "at"
declare = "declare"
else = "else"
for = "for"
in = "in"
new = "new"
others = "others"
procedure = "procedure"
renames = "renames"
subtype = "subtype"
use = "use"
access = "access"
begin = "begin"
delay = "delay"
end = "end"
function = "function"
is = "is"
not = "not"
out = "out"
raise = "raise"
return = "return"
task = "task"
when = "when"
all = "all"
body = "body"
delta = "delta"
entry = "entry"
generic = "generic"
limited = "limited"
nul = "nul"
package = "package"
range = "range"
reverse = "reverse"
terminate = "terminate"
while = "while"
integer = "integer"
asign = ":="
oprel = "<"|">"|"<="|">="|"="|"/="
id = {char}({char}|{digit}|{especialSymbol})*
ellipsis = ".."
commentBegin = "--"
endOfSentence = ";"
separator = ","
num = 0 | ([1-9]{digit}*)
real = {num}+"."{num}+
%{
    StringBuffer string = new StringBuffer();
    StringBuffer comment = new StringBuffer();
%}

%state STRING
%state COMMENTS

%%
<YYINITIAL>{
    {char}  {}
    {white} {}
    {enter} {System.out.println();}
    \" {string.setLength(0); yybegin(STRING);}
    {commentBegin} {comment.setLength(0); yybegin(COMMENTS);}
    {endOfSentence} {System.out.print("<endOfSentence>");}
    {separator} {System.out.print("<separator>");}
    {ellipsis} {System.out.print("<ellipsis>");}
    {abort} {System.out.print("<abort>");}
    {and} {System.out.print("<and>");}
    {case} {System.out.print("<case>");}
    {digits} {System.out.print("<digits>");}
    {exception} {System.out.print("<exception>");}
    {goto} {System.out.print("<goto>");}
    {loop} {System.out.print("<loop>");}
    {of} {System.out.print("<of>");}
    {record} {System.out.print("<record>");}
    {select} {System.out.print("<select>");}
    {then} {System.out.print("<then>");}
    {with} {System.out.print("<with>");}
    {abs} {System.out.print("<abs>");}
    {array} {System.out.print("<array>");}
    {constant} {System.out.print("<constant>");}
    {do} {System.out.print("<do>");}
    {exit} {System.out.print("<exit>");}
    {if} {System.out.print("<if>");}
    {mod} {System.out.print("<mod>");}
    {or} {System.out.print("<or>");}
    {private} {System.out.print("<private>");}
    {rem} {System.out.print("<rem>");}
    {separate} {System.out.print("<separate>");}
    {type} {System.out.print("<type>");}
    {xor} {System.out.print("<xor>");}
    {accept} {System.out.print("<accept>");}
    {at} {System.out.print("<at>");}
    {declare} {System.out.print("<declare>");}
    {else} {System.out.print("<else>");}
    {for} {System.out.print("<for>");}
    {in} {System.out.print("<in>");}
    {new} {System.out.print("<new>");}
    {others} {System.out.print("<others>");}
    {procedure} {System.out.print("<procedure>");}
    {renames} {System.out.print("<renames>");}
    {subtype} {System.out.print("<subtype>");}
    {use} {System.out.print("<use>");}
    {access} {System.out.print("<access>");}
    {begin} {System.out.print("<begin>");}
    {delay} {System.out.print("<delay>");}
    {end} {System.out.print("<end>");}
    {function} {System.out.print("<function>");}
    {is} {System.out.print("<is>");}
    {not} {System.out.print("<not>");}
    {out} {System.out.print("<not>");}
    {raise} {System.out.print("<raise>");}
    {return} {System.out.print("<return>");}
    {task} {System.out.print("<task>");}
    {when} {System.out.print("<when>");}
    {all} {System.out.print("<all>");}
    {body} {System.out.print("<body>");}
    {delta} {System.out.print("<delta>");}
    {entry} {System.out.print("<entry>");}
    {generic} {System.out.print("<generic>");}
    {limited} {System.out.print("<limited>");}
    {nul} {System.out.print("<nul>");}
    {package} {System.out.print("<package>");}
    {range} {System.out.print("<range>");}
    {reverse} {System.out.print("<reverse>");}
    {terminate} {System.out.print("<terminate>");}
    {while} {System.out.print("<while>");}
    {integer} {System.out.print("<integer>");}
    {id} {System.out.print("<id:"+yytext()+">");}
    {num} {System.out.print("<num:"+yytext()+">");}
    {real} {System.out.print("<real:"+yytext()+">");}
    {oprel} {System.out.print("<oprel:"+yytext()+">");}
    {asign} {System.out.print("<asign:"+yytext()+">");}
    . {System.out.print(yytext());}
}

<STRING> {
      \"                             { yybegin(YYINITIAL); 
                                       System.out.print("<string:"+string.toString()+">");}
      [^\n\r\"\\]+                   { string.append( yytext() ); }
      \\t                            { string.append('\t'); }
      \\n                            { string.append('\n'); }

      \\r                            { string.append('\r'); }
      \\\"                           { string.append('\"'); }
      \\                             { string.append('\\'); }
 }

<COMMENTS>{
    . {comment.append( yytext() );}
    {enter} {yybegin(YYINITIAL); 
             System.out.print("<comment:"+comment.toString()+">");}
}