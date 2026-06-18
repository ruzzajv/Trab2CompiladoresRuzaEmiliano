package scanner;

import java_cup.runtime.Symbol;
import parser.sym;
import erros.ListaErros;

%%

%class Scanner
%cupsym sym
%cup
%unicode
%line
%column
%public

%eofval{
    return criaSimbolo(sym.EOF);
%eofval}

%{
    private ListaErros listaErros;

    public Scanner(java.io.FileReader in, ListaErros listaErros) {
        this(in);
        this.listaErros = listaErros;
    }


    public ListaErros getListaErros() {
        return listaErros;
    }

    public void defineErro(int linha, int coluna, String texto) {
        listaErros.defineErro(linha, coluna, texto);
    }

    public void defineErro(int linha, int coluna) {
        listaErros.defineErro(linha, coluna);
    }

    public void defineErro(String texto) {
        listaErros.defineErro(texto);
    }

    private Symbol criaSimbolo(int code, Object value) {
        return new Symbol(code, yyline, yycolumn, value);
    }

    private Symbol criaSimbolo(int code) {
        return new Symbol(code, yyline, yycolumn, null);
    }
%}

FimDeLinha = \r\n|\r|\n
Espaco = [ \t\f] | {FimDeLinha}

Inteiro = 0|[1-9][0-9]*
Decimal = ([0-9]+\.[0-9]+)
Numero = {Inteiro}|{Decimal}

Letra = [a-zA-Z_]
Digito = [0-9]
Identificador = {Letra}({Letra}|{Digito})*

OpMais = "+"
OpMenos = "-"
OpMult = "*"
OpDiv = "/"

OpMaiorIgual = ">="
OpMenorIgual = "<="
OpIgualIgual = "=="
OpDiferente = "!="
OpMaior = ">"
OpMenor = "<"

OpAtribuicao = "="

PtoVirg = ";"
Virgula = ","
Ponto = "."
AbrePar = "("
FechaPar = ")"
AbreChave = "{"
FechaChave = "}"

KwIf = "if"
KwElse = "else"
KwWhile = "while"
KwReturn = "return"
KwInt = "int"
KwDouble = "double"
KwFloat = "float"
KwProgram = "program"
KwVoid = "void"
KwPrint = "print"
KwRead = "read"
KwFinal = "final"
KwClass = "class"

ComentarioLinha = "//"[^\r\n]*
ComentarioBloco = "/*"([^*]|\*+[^*/])*\*+"/"

%%

{Espaco} { }
{ComentarioLinha} { }
{ComentarioBloco} { }

{KwIf} { return criaSimbolo(sym.KW_IF); }
{KwElse} { return criaSimbolo(sym.KW_ELSE); }
{KwWhile} { return criaSimbolo(sym.KW_WHILE); }
{KwReturn} { return criaSimbolo(sym.KW_RETURN); }
{KwInt} { return criaSimbolo(sym.KW_INT); }
{KwDouble} { return criaSimbolo(sym.KW_DOUBLE); }
{KwFloat} { return criaSimbolo(sym.KW_FLOAT); }
{KwProgram} { return criaSimbolo(sym.KW_PROGRAM); }
{KwVoid} { return criaSimbolo(sym.KW_VOID); }
{KwPrint} { return criaSimbolo(sym.KW_PRINT); }
{KwRead} { return criaSimbolo(sym.KW_READ); }
{KwFinal} { return criaSimbolo(sym.KW_FINAL); }
{KwClass} { return criaSimbolo(sym.KW_CLASS); }

{Numero} {
    Double valor = Double.parseDouble(yytext());
    return criaSimbolo(sym.NUMBER, valor);
}

{Identificador} { return criaSimbolo(sym.ID, yytext()); }

{OpMaiorIgual} { return criaSimbolo(sym.MAIORIGUAL); }
{OpMenorIgual} { return criaSimbolo(sym.MENORIGUAL); }
{OpIgualIgual} { return criaSimbolo(sym.IGUALIGUAL); }
{OpDiferente} { return criaSimbolo(sym.DIF); }
{OpMaior} { return criaSimbolo(sym.MAIOR); }
{OpMenor} { return criaSimbolo(sym.MENOR); }
{OpAtribuicao} { return criaSimbolo(sym.ATRIB); }
{OpMais} { return criaSimbolo(sym.MAIS); }
{OpMenos} { return criaSimbolo(sym.MENOS); }
{OpMult} { return criaSimbolo(sym.MULT); }
{OpDiv} { return criaSimbolo(sym.DIV); }

{PtoVirg} { return criaSimbolo(sym.PTVIRG); }
{Virgula} { return criaSimbolo(sym.VIRGULA); }
{Ponto} { return criaSimbolo(sym.PONTO); }
{AbrePar} { return criaSimbolo(sym.ABREPAR); }
{FechaPar} { return criaSimbolo(sym.FECHAPAR); }
{AbreChave} { return criaSimbolo(sym.ABRECHAVE); }
{FechaChave} { return criaSimbolo(sym.FECHACHAVE); }

. { this.defineErro(yyline, yycolumn, "Léxico - Símbolo desconhecido: " + yytext()); }