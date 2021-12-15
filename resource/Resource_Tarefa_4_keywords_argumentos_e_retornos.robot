*** Settings ***
Documentation      Curso basico de Robot - Tarefa 4


*** Variable ***
&{PESSOA}   nome=Eder     
...         sobrenome=Estevan     
...         string=RobotNota10     
...         emailpadrao=@testerobot.com     


*** Keywords ***

Uma subkeyword com argumentos sobre a tarefa4
    [Arguments]     ${NOME_USUARIO}     ${SOBRENOME_USUARIO}    ${STRING_USUARIO}     ${EMAIL_PADRAO}
    Log    Email Cutomizado :${NOME_USUARIO}${SOBRENOME_USUARIO}${STRING_USUARIO}${EMAIL_PADRAO}


Customizar qualquer email
    Uma subkeyword com argumentos sobre a tarefa4    ${PESSOA.nome}    ${PESSOA.sobrenome}    ${PESSOA.string}    ${PESSOA.emailpadrao}
    Log    Email Padrão: ${PESSOA.nome}${PESSOA.sobrenome}${PESSOA.string}${PESSOA.emailpadrao}
