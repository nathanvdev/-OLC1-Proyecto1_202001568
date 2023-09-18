// ------------  Paquete e importaciones ------------
package JsonParser;

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

%{
%}

// ------> Expresiones Regulares

Double = \d+\.\d+
Comentario = "//".*
LINEAS = [^!]
ComentarioMultilinia = "/*"{LINEAS}* "*/"
Cadena = \"([^\"\r\n]*)\"

%%
// ------------  Reglas Lexicas -------------------

{Double}    { return new Symbol(sym.DOUBLE, yycolumn, yyline, yytext()); }
{Cadena}    { return new Symbol(sym.CADENA, yycolumn, yyline, yytext()); }
"{"         { return new Symbol(sym.BRACKET_O, yycolumn, yyline, yytext()); }
"}"         { return new Symbol(sym.BRACKET_C, yycolumn, yyline, yytext()); }
":"         { return new Symbol(sym.COLON, yycolumn, yyline, yytext()); }
","         { return new Symbol(sym.COMMA, yycolumn, yyline, yytext()); }

//------> Ingorados
[ \t\r\n\f]             {/* Espacios en blanco se ignoran */}
{Comentario}            {}
{ComentarioMultilinia}  {}

//------> Errores Léxicos
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }

