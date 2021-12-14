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
Requisitar todos os livros
    ${RESPOSTA}     GET On Session     fakerAPI    Books
    Log             ${RESPOSTA.text}
 