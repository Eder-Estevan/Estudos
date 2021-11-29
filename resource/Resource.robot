### Resource que faz as ações dos testes
*** Settings ***
Library		          SeleniumLibrary


### Variaveis que não são utilizada "declarada" nos testes devem vir para o resource
*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    chrome




### Neste momento iremos montar a Keyword para iniciarmos as ações
*** Keywords ***

### Settings - onde iremos declarar todas as nossa library
# Caso de Teste 01: Pesquisar produto existente
Abrir navegador
    Open Browser    http://automationpractice.com   ${BROWSER}

### TEARDOWN -  Ele roda uma roda keyword DEPOIS de uma suite ou de um teste
Fechar navegador
    Capture page Screenshot
    Close Browser


### Passo a Passo do caso de teste e suascações que as keywords realizará

Acessar página home do site
    Go To    ${URL}
    Title Should Be   My Store

Digitar o nome do produto "${PRODUTO}" no campo de Pesquisar
    Input Text    name=search_query    ${PRODUTO}

Clicar no botão Pesquisar
    Click Element   name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
### Wait utilizado para aguardar carregar algo ex:elemento, pagina etc..
    Wait Until Element Is Visible       css=#center_column > h1

### nomeclatura Should é utilizada para realizar validação de algo
    Title Should Be                     Search - My Store
    Page Should Contain Image           xPath=//*[@id="center_column"]//*[@src='${URL}/img/p/7/7-home_default.jpg']
    Page Should Contain Link            xPath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]


Conferir mensagem de erro "${MENSAGEM_ERRO}"
    Wait Until Element Is Visible    //*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be           //*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ERRO}

Dado que estou na pagina home
        Acessar página home do site
