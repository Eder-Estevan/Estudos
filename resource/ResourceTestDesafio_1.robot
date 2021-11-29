### Resource que faz as ações dos testes
*** Settings ***
Library		          SeleniumLibrary
Library             FakerLibrary


### Variaveis que não são utilizada "declarada" nos testes devem vir para o resource
*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    chrome
&{CAMPOS_OBRIGATORIOS}  name=May   lastname=Fernandes   passwd=123456   address1=Rua Framework, Bairro Robot
...                     id_city=Floripa    id_State=9    id_postcode=12345   id_Phone_mobile=999888777    infoAdicional=ROBOT Framework   EndAdicional=Rua Maranhão,600
@{SUBCATEGORIAS}    Printed Summer Dress



### Neste momento iremos montar a Keyword para iniciarmos as ações
*** Keywords ***

### ACESSAR O SITE ###
Abrir navegador
    Open Browser    http://automationpractice.com   ${BROWSER}
    Maximize Browser Window

### TEARDOWN -  Ele roda uma roda keyword DEPOIS de uma suite ou de um teste
Fechar navegador
    Capture page Screenshot
    Close Browser

### Desafio - Curso - Caso 1 ###
Desafio - Caso de teste 01: Listar produtos

Dado que estou na pagina home
  Go To    ${URL}
  Title Should Be   My Store

E passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
  Wait Until Element Is Visible     Xpath=//*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]
  Mouse Over                        Xpath=//*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]

E as sub categorias devem ser exibidas
  Wait Until Element Is Visible      Xpath=//*[@id="block_top_menu"]/ul/li[1]/ul

Quando clicar na sub categoria "Summer Dresses"
  Click Element    Xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Então uma página com os produtos da categoria selecionada deve ser exibida.
  Wait Until Element Is Visible     Xpath=//*[@id="center_column"]/div[1]/div
  Title Should Be   Summer Dresses - My Store
  Page Should Contain Element         xpath=//*[@id="center_column"]/ul/li[5]/div/div[2]/h5/a
  # [@title="Printed Summer Dress"]   @{SUBCATEGORIAS}


### Desafio - Curso - Caso 2 ###
Desafio - Caso de teste 02: Adicionar produtos no carrinho

E digitar o nome de produto "${PESQUISA_PROD}" no campo de pesquisa.
  Wait Until Element Is Visible    css:input#search_query_top
  Click Element                    css:input#search_query_top
  Input Text                       css:input#search_query_top   ${PESQUISA_PROD}

E clicar no botão de pesquisa o sistema deve exibir a tela com o resultado da pesquisa, listando o produto "${PESQUISA_PROD}" pesquisado.
  Wait Until Element Is Visible    css:button.btn.btn-default.button-search
  Click Element                    css:button.btn.btn-default.button-search
  Title Should Be                  Search - My Store
  Wait Until Element Is Visible    Xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img

E Clicar no botão "Add to cart" do produto, Uma tela de confirmação deve ser exibida.
  Mouse Up                          XPath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
  Click Element                     XPath=//*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]/span
  Page Should Contain Element       XPath=//*[@id="layer_cart"]/div[1]/div[1]

Quando clicar no botão "Proceed to checkout"
  Wait Until Element Is Visible      Xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span  10
  Click Element                      Xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span

Então a tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores.
  Wait Until Element Is Visible      css:td.cart_description
  Wait Until Element Is Visible      css:td#total_price_container.price
  Page Should Contain Element        css:td.cart_description
  Page Should Contain Element        css:td#total_price_container.price


### Desafio - Curso - Caso 3 ###
Desafio - Caso de teste 03: Remover produtos

# [Tags] DesafioCaso3
E voltar para pagina home
  Wait Until Element Is Visible     css:img.logo.img-responsive
  Click Element                     css:img.logo.img-responsive
  Title Should Be                   My Store

E clicar no ícone carrinho de compras no menu superior direito, carrinho de compras deve ser exibido
  Wait Until Element Is Visible     Xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a
  Click Element                     Xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a

Quando clicar no botão de remoção de produtos (delete) no produto do carrinho
  Wait Until Element Is Visible     css:i.icon-trash
  Click Element                     css:i.icon-trash

Então o sistema deve exibir a mensagem "${CAR_VAZIO}"
   Title Should Be                  Order - My Store
   Wait Until Element Is Visible    css:p.alert.alert-warning
   Should Be Equal                  ${CAR_VAZIO}    Your shopping cart is empty.

### Desafio - Curso - Caso 4 ###
Desafio - Caso de teste 04: Adicionar cliente

E clicar no botão superior direito “Sign in”, onde a pagina de login deve ser exibida
  Click Element       css:a.login
  Title Should Be     Login - My Store

E inserir um e-mail válido "${E-MAIL}"
  # Wait Until Element Is Visible    Xpath=//*[@id="create-account_form"]/div/div[2]/label
  # Click Element                    Xpath=//*[@id="email_create"]
  # Input Text                       Xpath=//*[@id="email_create"]  ${E-MAIL}

  # Wait Until Element Is Visible    id=email_create
  # ${EMAIL_FAKER}                        Generate Random String
  # Input Text                       id=email_create      ${EMAIL_FAKER}@testerobot.com

  Wait Until Element Is Visible    id=email_create
  ${EMAIL_FAKER}                   FakerLibrary.Email
  Input Text                       id=email_create      ${EMAIL_FAKER}

E clicar no botão "${CRI_CONTA}", onde a página com os campos de cadastro deve ser exibida.
  Wait Until Element Is Visible    Xpath=//*[@id="SubmitCreate"]
  Click Element                    Xpath=//*[@id="SubmitCreate"]/span
  Should Be Equal                  ${CRI_CONTA}    Create na account

Quando preencher os campos obrigatórios.
  Wait Until Element Is Visible    Xpath=//*[@id="account-creation_form"]/div[1]/div[1]/label   10
   Click Element                    css:input#id_gender1

   Input Text                       css:input#customer_firstname      ${CAMPOS_OBRIGATORIOS.name}
   Input Text                       css:input#customer_lastname       ${CAMPOS_OBRIGATORIOS.lastname}
   Input Text                       css:input#passwd                  ${CAMPOS_OBRIGATORIOS.passwd}

  Wait Until Element Is Visible    Xpath=//*[@id="account-creation_form"]/div[1]/div[6]/label
  Click Element                    css:option[value="28"]
  Click Element                    Xpath=//*[@id="months"]/option[3]
  Click Element                    Xpath=//*[@id="years"]/option[13]

  Input Text                       css:input#address1                 ${CAMPOS_OBRIGATORIOS.address1}
  Input Text                       css:input#city                     ${CAMPOS_OBRIGATORIOS.id_city}

  Wait Until Element Is Visible    css:label[for="id_state"]
  Click Element                    Xpath=//*[@id="id_state"]/option[6]

  Input Text                       css:input#postcode                 ${CAMPOS_OBRIGATORIOS.id_postcode}

  Wait Until Element Is Visible    css:label[for="id_country"]
  Click Element                     Xpath=//*[@id="id_country"]/option[2]

  Wait Until Element Is Visible    css:label[for="other"]
  Click Element                    css:textarea#other
  Input Text                       css:textarea#other                  ${CAMPOS_OBRIGATORIOS.infoAdicional}

  Input Text                       css:input#phone_mobile              ${CAMPOS_OBRIGATORIOS.id_Phone_mobile}
  Input Text                       css:input#alias                     ${CAMPOS_OBRIGATORIOS.EndAdicional}



  # Wait Until Element Is Visible    Xpath=//*[@id="account-creation_form"]/div[1]/div[1]/label   10
  # Click Element                    css:input#id_gender1

  # Wait Until Element Is Visible    css:label[for="customer_firstname"]
  # Input Text                       css:input#customer_firstname         Eder

  # Wait Until Element Is Visible    css:label[for="customer_lastname"]
  # Input Text                       css:input#customer_lastname          Estevan

  # Wait Until Element Is Visible    css:label[for="passwd"]
  # Input Text                       css:input#passwd                     123@Mudar

  # Wait Until Element Is Visible    Xpath=//*[@id="account-creation_form"]/div[1]/div[6]/label
  # Click Element                    css:option[value="28"]
  # Click Element                    Xpath=//*[@id="months"]/option[3]
  # Click Element                    Xpath=//*[@id="years"]/option[13]

  # Wait Until Element Is Visible    css:label[for="address1"]
  # Input Text                       css:input#address1                   Travessa Alvaro Augusto

  # Wait Until Element Is Visible    css:label[for="city"]
  # Input Text                       css:input#city                       São Paulo

  # Wait Until Element Is Visible    css:label[for="id_state"]
  # Click Element                    Xpath=//*[@id="id_state"]/option[6]

  # Wait Until Element Is Visible    css:label[for="postcode"]
  # Input Text                       css:input#postcode                    00000

  # Wait Until Element Is Visible    css:label[for="id_country"]
  # Click Element                     Xpath=//*[@id="id_country"]/option[2]

  # Wait Until Element Is Visible    css:label[for="other"]
  # Click Element                    css:textarea#other
  # Input Text                       css:textarea#other                   Robot Framework

  # Wait Until Element Is Visible    css:label[for="phone_mobile"]
  # Input Text                       css:input#phone_mobile                   01135123939

  # Wait Until Element Is Visible    css:label[for="alias"]
  # Input Text                       css:input#alias                       Maranhão, 600

E clicar em "Register" para finalizar o cadastro.
  Wait Until Element Is Visible    Xpath=//*[@id="submitAccount"]
  Click Element                    Xpath=//*[@id="submitAccount"]

Então a página de gerenciamento da conta deve ser exibida.
  Wait Until Element Is Visible         css:h1.page-heading
  Title Should Be                       My account - My Store
