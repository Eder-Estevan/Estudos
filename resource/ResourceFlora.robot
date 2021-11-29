### Resource que faz as ações dos testes
*** Settings ***
Library		          SeleniumLibrary


### Variaveis que não são utilizada "declarada" nos testes devem vir para o resource
*** Variables ***
${BROWSER}    chrome
${URL}        https://staging.floraenergia.com.br/



### Neste momento iremos montar a Keyword para iniciarmos as ações
*** Keywords ***

### Settings - onde iremos declarar todas as nossa library
Abrir navegador
    Open Browser    https://staging.floraenergia.com.br/    ${BROWSER}

Maximize tela
    Maximize Browser Window

### TEARDOWN -  Ele roda uma roda keyword DEPOIS de uma suite ou de um teste
Fechar navegador
    Close Browser


### Passo a Passo do caso de teste e suascações que as keywords realizará

Acessar página home do site
    Title Should Be   Flora Energia

Clicar no botão Cadastre-se
    Click Element   id=cadastro_lp

Digitar seu nome "${NOME}" no campo nome
    Input Text    name=name   ${NOME}
    Should Be Equal    ${NOME}   Eder Estevan

Digitar seu e-mail "${EMAIL}" no campo Email
    Input Text    name=email    ${EMAIL}

Digitar o número do seu celular "${CELULAR}" no campo Celular
    Input Text    name=phone_number   ${CELULAR}

Digitar a sigla do seu estado "${UF}" no campo UF
  Click Element    css:input[role=combobox]
  Input Text        css:input[role=combobox]    ${UF}

Digitar a cidade "${$CIDADE}" no campo Cidade
    Click Element       xPath=//*[@id="root"]/div[1]/div/div[4]/div[1]/div[2]/div[5]/div[2]/input
    Input Text          xPath=//*[@id="root"]/div[1]/div/div[4]/div[1]/div[2]/div[5]/div[2]/input   ${$CIDADE}

Digitar o valor da conta de luz "${VALOR}" no campo Conta de luz mensal
    Input Text    name=estimated_electric_bill  ${VALOR}

# Digitar o código "${COD_PROMO}" no campo Cód Promocional
#     Input Text   name=promocode   ${COD_PROMO}

Clicar no botão Avançar
    Click Element    css:button#cadastro_plataforma.mt-2.btn-register.btn.btn-primary
