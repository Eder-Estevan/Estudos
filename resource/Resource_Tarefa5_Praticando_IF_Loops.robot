*** Settings ***
Documentation       DESAFIO: Vamos praticar IF e Loops

*** Variables ***       0        1        2        3       4        5         6       7          8       9      10
@{LISTA_DE_CORES}    Branco   Preto   Vermelho   Azul   Verde    Amarelo    Roxo    Marrom    Laranja   Rosa   Ouro



*** Keyword ***
Tarefa 5 Praticando IF Loops

  Log To Console      ${\n}
  FOR  ${SEQ_NUM}   ${CORES}    IN ENUMERATE  @{LISTA_DE_CORES}
        IF  ${SEQ_NUM} == 5
            Log to Console      Eu sou o número: ${SEQ_NUM}!    
        ELSE IF  ${SEQ_NUM} == 10
            Log to Console      Eu sou o número: ${SEQ_NUM}! 
            No Operation
         
        ELSE
            Log to Console      Eu não sou o número 5 e nem o 10!  
            
        END
                
    
    END


### Outros exemplos de lógica para ser aprimorados - "Mary Fernandes"

*** Settings ***
Documentation    Exercício IF e FOR

*** Variables ***
@{NUMEROS}       0  3  5  7  9  10  12

*** Test Cases ***
Teste de imprimir apenas alguns números
  Imprimir somente se for 5 e 10

*** Keywords ***
Imprimir somente se for 5 e 10
  Log To Console  ${\n}

  FOR    ${numero}    IN   @{NUMEROS}
      IF  ${numero} == 5
          Log To Console    Eu sou o número 5!
      ELSE IF  ${numero} == 10
          Log To Console    Eu sou o número 10!
      ELSE
          Log To Console    Eu não sou o número 5 e nem o 10!
      END
  END

  Log To Console  ${\n}
  #FICA A DICA
  # Existem outros modos de fazer, veja abaixo:
  FOR    ${numero}    IN   @{NUMEROS}
      IF  ${numero} == 5 or ${numero} == 10
          Log To Console    Eu sou o número ${numero}!
      ELSE
          Log To Console    Eu não sou o número 5 e nem o 10!
      END
  END

  Log To Console  ${\n}
  FOR    ${numero}    IN   @{NUMEROS}
      IF  ${numero} in (5, 10)
          Log To Console    Eu sou o número ${numero}!
      ELSE
          Log To Console    Eu não sou o número 5 e nem o 10!
      END              
  END