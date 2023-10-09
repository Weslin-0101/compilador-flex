%{
#include <stdio.h>
#include <stdlib.h>
/* 
nome: Wesley Lira Carvalho       -  200044559
      Cleber de Oliveira Brant   -  200061216
      Mateus Vinicius Vieira     -  202016963
      Pedro Lucas Dourado Santos -  211039680
*/

enum { DATA, END_OF_FILE };
int count_valid = 0;
%}

delim   [ \t\n]
brancos {delim}+
digito  [0-9]
ano     (19|20){digito}{digito}
ano19   19(04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)
ano20   20(00|04|08|12|16|20)
data28  ([0-1][1-9]|2[0-8])\/02\/{ano}
data30  ([0-2][1-9]|30)\/((0(4|6|9))|11)\/{ano}
data31  ([0-2][1-9]|3[0-1])\/((0(1|3|5|7|8))|(10|12))\/{ano}
data29  29\/02\/({ano19}|{ano20})
result  {data29}|{data31}|{data30}|{data28}({brancos}|$)

%%
{brancos}+  { /* ignorar */ }
{result}    { count_valid++; }
.           { /* ignorar caracteres após o final do arquivo */ }
<<EOF>>     { return END_OF_FILE; }
%%

int main() {
    yylex();

    printf("%d\n", count_valid);
    return 0;
}

int yywrap() {
    return 1;
}