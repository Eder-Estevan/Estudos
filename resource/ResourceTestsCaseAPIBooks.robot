*** Settings ***
# Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library           RequestsLibrary
Library           Collections

*** Variable ***
${URL_API}            https://fakerestapi.azurewebsites.net/api/v1/
# ${URL_API}            https://webmaniabr.com/api/1/cep
&{BOOK_15}            id=15
...                   title=Book 15
...                   pageCount=1500



*** Keywords ***
 ### SETUP E TEARDOWNS

Conectar API
  Create Session    fakerAPI    ${URL_API}


### Ações
Requisitar todos os livros
  # [Arguments]           ${CEP_DESEJADO}
  ${RESPOSTA_API}       Get Request    fakerAPI     Books
  Log                   ${RESPOSTA_API.text}
  Set Test Variable     ${RESPOSTA_API}

Requisitar o livro "${ID_LIVRO}"
    # [Arguments]           ${CEP_DESEJADO}
    ${RESPOSTA_API}       Get Request    fakerAPI     Books/${ID_LIVRO}
    Log                   ${RESPOSTA_API.text}
    Set Test Variable     ${RESPOSTA_API}


#### Conferencias
Conferir o staus Code
  [Arguments]         ${STATUSCODE_DESEJADO}
  Should Be Equal As Strings    ${RESPOSTA_API.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
  [Arguments]       ${REASON_DESEJADO}
  should Be Equal As Strings      ${RESPOSTA_API.reason}      ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
  Length Should Be    ${RESPOSTA_API.json()}    ${QTDE_LIVROS}

Conferir se retorna todos os dados corretos do livro 15
  Dictionary Should Contain Item    ${RESPOSTA_API.json()}    id           ${BOOK_15.id}
  Dictionary Should Contain Item    ${RESPOSTA_API.json()}    title        ${BOOK_15.title}
  Dictionary Should Contain Item    ${RESPOSTA_API.json()}    pageCount    ${BOOK_15.pageCount}
  Should Not Be Empty    ${RESPOSTA_API.json()["description"]}
  Should Not Be Empty    ${RESPOSTA_API.json()["excerpt"]}
  Should Not Be Empty    ${RESPOSTA_API.json()["publishDate"]}


Cadastrar um novo livro
  ${HEADERS}            Create Dictionary    content-type=application/json
  ${RESPOSTA_API}       Post Request    fakerAPI    Books
  ...                                   data={"id": 2323,"title": "teste","description": "teste","pageCount": 200,"excerpt": "teste","publishDate": "2020-11-03T22:48:26.32Z"}
  ...                                   headers=${HEADERS}
  Log                   ${RESPOSTA_API.text}
  Set Test Variable     ${RESPOSTA_API}

# Confere o status code
#       [Arguments]     ${STATUS_ESPERADO}
#       Should Be Equal As Strings   ${RESPOSTA.status_code}  ${STATUS_ESPERADO}
#       Log             Status Code Retornado: ${RESPOSTA.status_code} -- Status Code Esperado: ${STATUS_ESPERADO}
#
# Confere endereço do CEP
#       [Arguments]         ${ENDERECO}
#       Dictionary Should Contain Item  ${RESPOSTA.json()}  endereco   ${ENDERECO}
#
# Confere bairro do CEP
#       [Arguments]         ${BAIRRO}
#       Dictionary Should Contain Item  ${RESPOSTA.json()}  bairro   ${BAIRRO}
#
# Confere cidade do CEP
#       [Arguments]         ${CIDADE}
#       Dictionary Should Contain Item  ${RESPOSTA.json()}  cidade   ${CIDADE}
#
# Confere UF do CEP
#       [Arguments]         ${UF}
#       Dictionary Should Contain Item  ${RESPOSTA.json()}  uf   ${UF}
#
# Confere CEP
#       [Arguments]         ${CEP}
#       Dictionary Should Contain Item  ${RESPOSTA.json()}  cep   ${CEP}
