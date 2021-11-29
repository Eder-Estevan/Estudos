## -MONTANDO ESTRUTURA DA SUITE-

### Settings - onde iremos declarar todas as nossa library
*** Settings ***
Resource            ../resource/ResourceFlora.robot
Test Setup          Abrir navegador
#Test Teardown       Fechar navegador
### SETUP - ele roda keywords antes da suite ou ANTES de um testes
### TEARDOWN -  Ele roda uma roda keyword DEPOIS de uma suite ou de um teste


### Variables - onde declaramos as variaveis globais do projeto
##*** Variables ***



### Test Case - Onde iremos descrever os caso de testes
*** Test Case ***
Caso de Teste 01: Cadastrar cliente
    Acessar página home do site
#   ##Conferir se a página home foi exibida
    Clicar no botão Cadastre-se
    Digitar seu nome "Eder Estevan" no campo nome
    Digitar seu e-mail "eder.estevan@floraenergia.com.br" no campo Email
    Digitar o número do seu celular "11 984036616" no campo Celular
    Digitar a sigla do seu estado "SP" no campo UF
    Digitar a cidade "Campinas" no campo Cidade
    Digitar o valor da conta de luz "300" no campo Conta de luz mensal
    # Digitar o código "Quero Mais Desconto" no campo Cód Promocional
    Clicar no botão Avançar
#
#     Conferir se o produto "Blouse" foi listado no site
#
#
# Caso de Teste 02: Pesquisar produto não existente
#
#     Acessar página home do site
#     ##Conferir se a página home foi exibida
#     Digitar o nome do produto "ItemNãoExistente" no campo de Pesquisar
#     Clicar no botão Pesquisar
#     Conferir mensagem de erro "No result where found your search "ItemNãoExistente""

##*** Keywords ***
