// ------------  Paquete e importaciones ------------
package Parser_statpy;

import java_cup.runtime.*;

%%
//-------> Directivas (No tocar)

%public
%class Lexer
%cup
%char
%column
%line
%unicode
%ignorecase

%init{
    yyline = 1;
    yychar = 1;
%init}

// ------> Expresiones Regulares
Comentario = "//".*
LINEAS = [^!]
ComentarioMultilinia = "/*"{LINEAS}* "*/"

elseif = else\s+if
cadena =    \"([^\"\r\n]*)\"
variable =  \w+
decimal =   \d+\.\d+
entero =    [0-9]+



%%
// ------------  Reglas Lexicas -------------------

//----------------Palabras Reservadas--------------------------------------------
"switch"            {return new Symbol(sym.RSWITCH, yycolumn, yyline, yytext());}
"void"              {return new Symbol(sym.RVOID, yycolumn, yyline, yytext());}
"main"              {return new Symbol(sym.RMAIN, yycolumn, yyline, yytext());}
"DefinirGlobales"   {return new Symbol(sym.RGLOBALES, yycolumn, yyline, yytext());}
"string"            {return new Symbol(sym.RSTRING, yycolumn, yyline, yytext());}
"double"            {return new Symbol(sym.RDOUBLE, yycolumn, yyline, yytext());}
"NewValor"          {return new Symbol(sym.RNEWVAL, yycolumn, yyline, yytext());}
"console"           {return new Symbol(sym.RCONSOLE, yycolumn, yyline, yytext());}
"write"             {return new Symbol(sym.RWRITE, yycolumn, yyline, yytext());}
"graficabarras"     {return new Symbol(sym.RBARRAS, yycolumn, yyline, yytext());}
"titulo"            {return new Symbol(sym.RTITULO, yycolumn, yyline, yytext());}
"ejex"              {return new Symbol(sym.REJEX, yycolumn, yyline, yytext());}
"valores"           {return new Symbol(sym.RVALORES, yycolumn, yyline, yytext());}
"titulox"           {return new Symbol(sym.RTITULOX, yycolumn, yyline, yytext());}
"tituloy"           {return new Symbol(sym.RTITULOY, yycolumn, yyline, yytext());}
"graficapie"        {return new Symbol(sym.RPIE, yycolumn, yyline, yytext());}
"true"              {return new Symbol(sym.TRUE, yycolumn, yyline, yytext());}
"false"             {return new Symbol(sym.TRUE, yycolumn, yyline, yytext());}
"&&"                {return new Symbol(sym.RAND, yycolumn, yyline, yytext());}
"||"                {return new Symbol(sym.ROR, yycolumn, yyline, yytext());}
"int"               {return new Symbol(sym.RINT, yycolumn, yyline, yytext());}
"char"              {return new Symbol(sym.RCHAR, yycolumn, yyline, yytext());}
"bool"              {return new Symbol(sym.RBOOL, yycolumn, yyline, yytext());}
"if"                {return new Symbol(sym.RIF, yycolumn, yyline, yytext());}
"else"              {return new Symbol(sym.RELSE, yycolumn, yyline, yytext());}
{elseif}            {return new Symbol(sym.RELIF, yycolumn, yyline, yytext());}
"default"           {return new Symbol(sym.RDEFAULT, yycolumn, yyline, yytext());}
"case"              {return new Symbol(sym.RCASE, yycolumn, yyline, yytext());}
"break"             {return new Symbol(sym.BREAK, yycolumn, yyline, yytext());}
"for"               {return new Symbol(sym.RFOR, yycolumn, yyline, yytext());}
"while"             {return new Symbol(sym.RWHILE, yycolumn, yyline, yytext());}
"do"                {return new Symbol(sym.RDOWHILE, yycolumn, yyline, yytext());}


//----------------Simbolos-------------------------------------------------------

"("                 {return new Symbol(sym.PARENTESIS_O, yycolumn, yyline, yytext());}
")"                 {return new Symbol(sym.PARENTESIS_C, yycolumn, yyline, yytext());}
"."                 {return new Symbol(sym.DOT, yycolumn, yyline, yytext());}
","                 {return new Symbol(sym.COMMA, yycolumn, yyline, yytext());}
"$"                 {return new Symbol(sym.DOLLAR, yycolumn, yyline, yytext());}
"{"                 {return new Symbol(sym.CURLY_O, yycolumn, yyline, yytext());}
"}"                 {return new Symbol(sym.CURLY_C, yycolumn, yyline, yytext());}
"="                 {return new Symbol(sym.EQUALS, yycolumn, yyline, yytext());}
";"                 {return new Symbol(sym.SEMICOLON, yycolumn, yyline, yytext());}
"["                 {return new Symbol(sym.BRACKET_O, yycolumn, yyline, yytext());}
"]"                 {return new Symbol(sym.BRACKET_C, yycolumn, yyline, yytext());}
"!"                 {return new Symbol(sym.NOT, yycolumn, yyline, yytext());}
"+"                 {return new Symbol(sym.PLUS, yycolumn, yyline, yytext());}
"-"                 {return new Symbol(sym.LESS, yycolumn, yyline, yytext());}
"*"                 {return new Symbol(sym.BY, yycolumn, yyline, yytext());}
"/"                 {return new Symbol(sym.DIVIDED, yycolumn, yyline, yytext());}
"<"                 {return new Symbol(sym.MINOR, yycolumn, yyline, yytext());}
">"                 {return new Symbol(sym.GREATER, yycolumn, yyline, yytext());}
"<="                {return new Symbol(sym.MINOREQUAL, yycolumn, yyline, yytext());}
">="                {return new Symbol(sym.GREATEREQUAL, yycolumn, yyline, yytext());}
"=="                {return new Symbol(sym.EQUALEQUAL, yycolumn, yyline, yytext());}
"!="                {return new Symbol(sym.DIFERENT, yycolumn, yyline, yytext());}
":"                 {return new Symbol(sym.COLON, yycolumn, yyline, yytext());}

//------------------REGEX----------------------------------------------------------
{entero}            {return new Symbol(sym.ENTERO, yycolumn, yyline, yytext());}
{decimal}           {return new Symbol(sym.DECIMAL, yycolumn, yyline, yytext());}
{cadena}            {return new Symbol(sym.CADENA, yycolumn, yyline, yytext());}
{variable}          {return new Symbol(sym.VARIABLE, yycolumn, yyline, yytext());}




//------> Ingorados
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}
{Comentario}            {}
{ComentarioMultilinia}  {}

//------> Errores Léxicos
.               { System.out.println("Error Lexico: " + yytext() + " | Fila1" + yyline + " | Columna: " + yycolumn); }

