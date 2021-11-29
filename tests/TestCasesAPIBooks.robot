*** Settings ***
# Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource         ../resource/ResourceTestsCaseAPIBooks.robot
Suite Setup       Conectar API

*** Variable ***
# ${URL_API}            https://fakerestapi.azurewebsites.net/api/v1

*** Test Case ***

Buscar a listagem de todos os livros (GET em todos os livros)
  [Tags]  api_caso1

  Requisitar todos os livros
  Conferir o staus Code    200
  Conferir o reason     OK
  Conferir se retorna uma lista com "200" livros

#

Buscar um livro especifico (GET em um Livro especifico)
  [Tags]  api_caso2

  Requisitar o livro "15"
  Conferir o staus Code    200
  Conferir o reason     OK
  Conferir se retorna todos os dados corretos do livro 15
#

Cadastrar um novo livro (POST)
  [Tags]  api_caso3
  
  Cadastrar um novo livro
#   COnferir se retorna todos os dados cadastrados para o livro novo
#
# Alterar um livro (PUT)
#   Conferir se retorna todos os dadoso alterados do livro 150
#
# Deletar um livro (DELETE)
#   COferir se deleta o livro 200
