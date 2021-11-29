*** Settings ***
Documentation      Exempplo de usoa de vriaveis como argumentos em keywords


*** Variable ***
&{PESSOA}   nome=May      sobrenome=Fernadndes    string=2021     emailpadrao=@testerobot.com     email=mayfernandes@exemplo.com.br    idade=12     sexo=feminino



*** Keywords ***
# Uma keyword qualquer 01
#     Uma subkeyword com argumentos     ${PESSOA.nome}    ${PESSOA.email}
#     ${MENSAGEM_ALERTA}    Uma subkeyword com retorno    ${PESSOA.nome}      ${PESSOA.idade}
#     Log       ${MENSAGEM_ALERTA}

# Uma subkeyword com argumentos
#     [Arguments]     ${NOME_USUARIO}     ${EMAIL_USUARIO}
#     Log       Nome Usuario: ${NOME_USUARIO}${EMAIL_USUARIO}
#     # Log       Email: ${EMAIL_USUARIO}
#
#
# Uma subkeyword com retorno
#     [Arguments]     ${NOME_USUARIO}     ${IDADE_USUARIO}
#     ${MENSAGEM}     Set Variable If     ${IDADE_USUARIO}<18     Não autorizado! O usuario ${NOME_USUARIO}  é menos de idade!
#     [Return]        ${MENSAGEM}


Uma subkeyword com argumentos sobre a tarefa4
    [Arguments]     ${NOME_USUARIO}     ${SOBRENOME_USUARIO}    ${STRING_USUARIO}     ${EMAIL_PADRAO}
    Log    Email Cutomizado :${NOME_USUARIO}${SOBRENOME_USUARIO}${STRING_USUARIO}${EMAIL_PADRAO}


Customizar qualquer email
    Uma subkeyword com argumentos sobre a tarefa4    ${PESSOA.nome}    ${PESSOA.sobrenome}    ${PESSOA.string}    ${PESSOA.emailpadrao}
    Log    Email Padrão: ${PESSOA.nome}${PESSOA.sobrenome}${PESSOA.string}${PESSOA.emailpadrao}
