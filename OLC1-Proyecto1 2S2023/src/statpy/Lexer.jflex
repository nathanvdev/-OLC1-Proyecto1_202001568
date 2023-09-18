// ------------  Paquete e importaciones ------------
package statpy;

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
comentario = []

cadena = \"([^\"\r\n]*)\"

%%
// ------------  Reglas Lexicas -------------------
"("         {return new Symbol(sym.PARENTESIS_A, yycolumn, yyline, yytext());}
")"         {return new Symbol(sym.PARENTESIS_C, yycolumn, yyline, yytext());}
"."         {return new Symbol(sym.DOT, yycolumn, yyline, yytext());}

"console"   {return new Symbol(sym.RCONSOLE, yycolumn, yyline, yytext());}
"write"     {return new Symbol(sym.RWRITE, yycolumn, yyline, yytext());}
{cadena}     {return new Symbol(sym.CADENA, yycolumn, yyline, yytext());}

comentario {}

//------> Ingorados
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }

