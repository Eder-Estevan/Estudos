*** Settings ***

Documentation       Exemplo de escopo de variaveis: GLOBAIS, SUITE, TESTE (test case) e LOCAL (keyword)
Library             String
Resource            ../resource/Resource_24_Escopo_Variaveis.robot



*** Test Cases ***
Caso de teste de exemplo 01
    [Tags]   Variaveis_caso1

    Uma Keyword qualquer 01
    Uma keyword qualquer 02

Caso de teste de exemplo 02
    Uma Keyword qualquer 02
    Uma keyword qualuqer 03

Caso de teste de exemplo 03
    Uma keyword qualquer 04






