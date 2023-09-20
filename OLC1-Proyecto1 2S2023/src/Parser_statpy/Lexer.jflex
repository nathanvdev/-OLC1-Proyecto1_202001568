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

cadena = \"([^\"\r\n]*)\"
variable = \w+
decimal = \d+\.\d+



%%
// ------------  Reglas Lexicas -------------------

//----------------Palabras Reservadas--------------------------------------------

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

//------------------REGEX----------------------------------------------------------

{cadena}            {return new Symbol(sym.CADENA, yycolumn, yyline, yytext());}
{variable}          {return new Symbol(sym.RVARIABLE, yycolumn, yyline, yytext());}
{decimal}           {return new Symbol(sym.DECIMAL, yycolumn, yyline, yytext());}


//------> Ingorados
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}
{Comentario}            {}
{ComentarioMultilinia}  {}

//------> Errores Léxicos
.               { System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }

