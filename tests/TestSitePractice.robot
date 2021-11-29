## -MONTANDO ESTRUTURA DA SUITE-

### Settings - onde iremos declarar todas as nossa library
*** Settings ***
Resource            ../resource/Resource.robot
Test Setup         Abrir navegador
Test Teardown       Fechar navegador
### SETUP - ele roda keywords antes da suite ou ANTES de um testes
### TEARDOWN -  Ele roda uma roda keyword DEPOIS de uma suite ou de um teste


### Variables - onde declaramos as variaveis globais do projeto
##*** Variables ***



### Test Case - Onde iremos descrever os caso de testes
*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    Acessar página home do site
    Digitar o nome do produto "Blouse" no campo de Pesquisar
    Clicar no botão Pesquisar
    Conferir se o produto "Blouse" foi listado no site


Caso de Teste 02: Pesquisar produto não existente
    Acessar página home do site
    ##Conferir se a página home foi exibida
    Digitar o nome do produto "ItemNãoExistente" no campo de Pesquisar
    Clicar no botão Pesquisar
    Conferir mensagem de erro "No result where found your search "ItemNãoExistente"

##*** Keywords ***
