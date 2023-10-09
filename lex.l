LETRA[a-zA-Z]
VOGAIS[aeiouAEIOU]
WHITESPACE[ ]
TAB[\t]
QUEBRA[\n]
%{
    /* 
        Integrantes do grupo
        Gabriela de Oliveira Lemos - 170010872
        Julia Farias Sousa - 180103792
        Thiago Franca Valo Oliveira - 170114929
        Yan Andrade de Sena - 180145363
    */
    #include<stdio.h>
    #include<string.h>
    int tritongo = 0;
    int ditongo = 0;
    int palavra = 0;
%}

%%
{LETRA}*{VOGAIS}{VOGAIS}{VOGAIS}{LETRA}* {tritongo++; palavra++;}
{LETRA}*{VOGAIS}{VOGAIS}{LETRA}* {ditongo++; palavra++;}
{LETRA}+ {palavra++;}
{WHITESPACE}+            /*Eliminaespacosembranco*/
{TAB}+                    /*EliminaTab*/
{QUEBRA}+            /*EliminaQuebradeLinha*/
%%
int yywrap();

int main(void)
{
    yylex();
    printf("%d %d %d\n", tritongo, ditongo, palavra);
    return 0;
}

int yywrap()
{
    return 1;
}