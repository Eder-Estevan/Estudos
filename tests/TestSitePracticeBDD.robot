## -MONTANDO ESTRUTURA DA SUITE-

### Settings - onde iremos declarar todas as nossa library
*** Settings ***
Resource            ../resource/Resource.robot
Test Setup         Abrir navegador
# Test Teardown       Fechar navegador
### SETUP - ele roda keywords antes da suite ou ANTES de um testes

### TEARDOWN -  Ele roda uma roda keyword DEPOIS de uma suite ou de um teste


### Variables - onde declaramos as variaveis globais do projeto
*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    chrome


### Test Case - Onde iremos descrever os caso de testes
*** Test Case ***
Cenário 01: Pesquisar produto existente
    Dado que estou da pagina home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na pagina de resultado da busca
#
# Cenário 02: Pesquisar produto não existente
#
#   Dado que estou da pagina home do site
#   Quando eu pesquisar pelo produto "ItemNãoExistente"
#   Então a pagina deve exibir a mensagem "No result where found your search "ItemNãoExistente""

*** Keywords ***
Dado que estou da pagina home do site
    Acessar página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de Pesquisar
    Clicar no botão Pesquisar

Então o produto "${PRODUTO}" deve ser listado na pagina de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site
