*** Settings ***

Resource          ../resource/ResourceTestDesafio_1.robot
Test Setup        Abrir navegador
# Test Teardown     Fechar navegador

# *** Variables ***
# ${BROWSER}    chrome
# ${URL}        http://automationpractice.com

*** Test Case ***
## Desafio - Curso - Caso 1 ###
Desafio - Caso de teste 01: Listar produtos
    [Tags]    Desafio1

    Dado que estou na pagina home
    E passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    E as sub categorias devem ser exibidas
    Quando clicar na sub categoria "Summer Dresses"
    Então uma página com os produtos da categoria selecionada deve ser exibida.

## Desafio - Curso - Caso 2 ###
Desafio - Caso de teste 02: Adicionar produtos no carrinho
  [Tags]    Desafio2

  Dado que estou na pagina home
  E digitar o nome de produto "T-SHIRT" no campo de pesquisa.
  E clicar no botão de pesquisa o sistema deve exibir a tela com o resultado da pesquisa, listando o produto "T-SHIRT" pesquisado.
  E Clicar no botão "Add to cart" do produto, Uma tela de confirmação deve ser exibida.
  Quando clicar no botão "Proceed to checkout"
  Então a tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores.

### Desafio - Curso - Caso 3 ###
Desafio - Caso de teste 03: Remover produtos
  [Tags]    Desafio3

  Dado que estou na pagina home
  E digitar o nome de produto "T-SHIRT" no campo de pesquisa.
  E clicar no botão de pesquisa o sistema deve exibir a tela com o resultado da pesquisa, listando o produto "T-SHIRT" pesquisado.
  E Clicar no botão "Add to cart" do produto, Uma tela de confirmação deve ser exibida.
  E voltar para pagina home
  E clicar no ícone carrinho de compras no menu superior direito, carrinho de compras deve ser exibido
  Quando clicar no botão de remoção de produtos (delete) no produto do carrinho
  Então o sistema deve exibir a mensagem "Your shopping cart is empty."

### Desafio - Curso - Caso 4 ###
Desafio - Caso de teste 04: Adicionar cliente
  [Tags]    Desafio4

  Dado que estou na pagina home
  E clicar no botão superior direito “Sign in”, onde a pagina de login deve ser exibida
  E inserir um e-mail válido "eder3_estevan@hotmail.com"
  E clicar no botão "Create na account", onde a página com os campos de cadastro deve ser exibida.
  Quando preencher os campos obrigatórios.
  E clicar em "Register" para finalizar o cadastro.
  Então a página de gerenciamento da conta deve ser exibida.
