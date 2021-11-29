*** Settings ***
Documentation   Exemplo de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS
Library		          SeleniumLibrary
Library             FakerLibrary

*** Variable ***
${URL}        http://automationpractice.com
${BROWSER}    chrome


#Simples
${GLOBAL_SIMPLES}   Vamos ver os tipos de variáveis no robot!

#Tipo Lista
@{FRUTAS}    morango   banana   maça   uva   abacaxi

@{SUB_CATEGORIAS}   Printed Summer Dress     Printed Summer Dress    Printed Chiffon Dress

#Tipo Dicionário
&{PESSOA}    nome=May Fernandes   email=mayfernandes@exemplo.com.br   idade=28   sexo=feminino




*** Keywords ***
Uma keyword qualquer 01
    #Simples
    Log    ${GLOBAL_SIMPLES}

    #Lista
    Log    Essa tem que ser maça: ${FRUTAS[2]} e essa tem que ser morango: ${FRUTAS[0]}

    #Dicionário
    Log    Nome: ${PESSOA.nome} e email: ${PESSOA.email}


###########################################################

Caso de teste 25 - Exercico Lista

Abrir navegador
  Open Browser    http://automationpractice.com   ${BROWSER}
  Maximize Browser Window

Fechar navegador
  Capture page Screenshot
  Close Browser

Dado que estou na pagina home
    Go To    ${URL}
    Title Should Be   My Store

Quando clicar na Categoria "${CATEGORIA}"
  Mouse Up                          Xpath=//*[@id="block_top_menu"]/ul/li[1]/a
  Wait Until Element Is Visible      Xpath=//*[@id="block_top_menu"]/ul/li[1]/ul
  Click Element                     Xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Então validar as SubCategorias
  Page Should Contain Element           Xpath=//*[@id="center_column"]/h1/span[contains(text(),"Summer Dresses")]
  Page Should Contain Element           Xpath=//*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a[@title="${SUB_CATEGORIAS[0]}"]
  Page Should Contain Element           Xpath=//*[@id="center_column"]/ul/li[2]/div/div[2]/h5/a[@title="${SUB_CATEGORIAS[1]}"]
  Page Should Contain Element           Xpath=//*[@id="center_column"]/ul/li[3]/div/div[2]/h5/a[@title="${SUB_CATEGORIAS[2]}"]
