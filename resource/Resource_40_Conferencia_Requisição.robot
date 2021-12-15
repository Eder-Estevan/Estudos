*** Settings ***
Library             RequestsLibrary
Library             Collections


*** Variable ***
${URL_API}      https://fakerestapi.azurewebsites.net/api/v1/

*** Keywords ***

### SETUP E TEARDOWNS

Conectar a minha API    
    Create Session      fakerAPI   ${URL_API}

### AÇÕES
### Automatizando GET normal
Requisitar todos os livros
    ${RESPOSTA}     GET On Session     fakerAPI    Books
    Log                     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}     GET On Session     fakerAPI    Books/${ID_LIVRO}
    Log                     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

### Conferencias

Conferir o status code
    [Arguments]                     ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings      ${RESPOSTA.status_code}     ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]                     ${REASON_DESEJADO}
    Should Be Equal As Strings      ${RESPOSTA.reason}      ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    Length Should Be        ${RESPOSTA.json()}      ${QTDE_LIVROS}