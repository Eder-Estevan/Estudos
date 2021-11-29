*** Settings ***
Documentation   Exemplo de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS
Resource        ../resource/Resource_25_TiposVariaveis.robot
Test Setup        Abrir navegador


*** Test Cases ***
# Caso de teste de exemplo 01
#     Uma keyword qualquer 01
#
# Desafio - Caso de teste 04: Adicionar cliente
#   [Tags]    Desafio4
#
#   Dado que estou na pagina home
#   E clicar no botão superior direito “Sign in”, onde a pagina de login deve ser exibida
#   E inserir um e-mail válido "eder3_estevan@hotmail.com"
#   E clicar no botão "Create na account", onde a página com os campos de cadastro deve ser exibida.
#   Quando preencher os campos obrigatórios.
#   E clicar em "Register" para finalizar o cadastro.
#   Então a página de gerenciamento da conta deve ser exibida.




Caso de teste 25 - Exercico Lista

  Dado que estou na pagina home
  Quando clicar na Categoria "Summer Dresser"
  Então validar as SubCategorias
