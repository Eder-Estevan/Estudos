*** Settings ***

Documentation       Exemplo de escopo de variaveis: GLOBAIS, SUITE, TESTE (test case) e LOCAL (keyword)


*** Variables ***

${GLOBAL_INSTANCIADA}       Moinha variavel GLOBAL_INSTANCIADA foi instanciada para SUITE



*** Keywords ***

Uma Keyword qualquer 01

                                        ###"Generate Randon String" cria um string qualquer e adiciona na variavel 
    ${GLOBAL_CRIADA_EM_TEMPO_DE_EXECUÇÃO}    Generate Random String
    #A variavel "global" pode ser utilizar em todas as suites em execução

    Set Global Variable    ${GLOBAL_CRIADA_EM_TEMPO_DE_EXECUÇÃO}
    #A variavel "suite" pode ser utilizada somente nos testes da suite em execução

    Set Suite Variable      ${SUITE_CRIADA_EM_TEMPO_EXECUÇÃO}     Variavel da suite
    #A variavel "teste" poder ser utilizada somente em todas as keywordas do teste em execução

    Set Test Variable       ${TESTE_01}       variavel do teste 01
    Log                     ${TESTE_01}
    #A variavel "local" pode ser utilizada somente na keyword em execução

    ${LOCAL}    Set Variable    variavel local da keyword 01


Uma keyword qualquer 02

    ${LOCAL}        Set Variable        variavel local da keyword 02
    Log     ${LOCAL}
    Log     ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_DE_EXECUÇÃO} / ${SUITE_CRIADA_EM_TEMPO_EXECUÇÃO} / ${LOCAL}
    #A keyword abaixo vai funcionar no caso de teste 01 e falar no caso de teste 02
    Log     ${TESTE_01}
    

Uma keyword qualquer 03
    ${LOCAL}     Set Variable    Variável local da keyword 03
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}

Uma keyword qualquer 04
    ${LOCAL}     Set Variable    Variável local da keyword 04
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}