*** Settings ***
Documentation       Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource            ../resource/Resource_41_Conferencias_JSON_Body.robot
Suite Setup         Conectar a minha API


    ### Validações basicas em uma API: 
    ### Status_code = ${RESPOSTA.status_code}
    ### reason  = ${RESPOSTA.reason}
    ### Headers = ${RESPOSTA.headers}
    ### Body em seu formato digital = ${RESPOSTA.content}
    ### Body em texto = ${RESPOSTA.text}
    ### Body em formato especifico "para navegar no arquivo", exemplo JSON = ${RESPOSTA.json()}
    ### Atenção: caso acontece algum erro verificar se a cada requisição está retornando respostas aleatoria, neste caso deverá verifcar se a resosta pelomento não ja vazia

*** Test Case ***
### Automatizando GET normal
Buscar a listagem de todos os livros (GET em todos os livros)
    Requisitar todos os livros
    ## Passando variavel por Argumentos: usuando tabulação, declarando e chamando no resource
    Conferir o status code      200
    ## Passando variavel por Argumentos: usuando tabulação, declarando e chamando no resource
    Conferir o reason       OK
    ## Passando variavel imbutida na keyword
    Conferir se retorna uma lista com "200" livros

Buscar um livro especifico (GET em um livro especifico)
    Requisitar o livro "15"
    ## Passando variavel por Argumentos: usuando tabulação, declarando e chamando no resource
    Conferir o status code      200
    ## Passando variavel por Argumentos: usuando tabulação, declarando e chamando no resource
    Conferir o reason       OK
    Conferir se retorna todos os dados corretos do livro 15
    



    

