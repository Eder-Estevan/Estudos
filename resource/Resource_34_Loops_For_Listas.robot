*** Settings ***
Documentation    Vamos aprender a fazer LOOPS usuando o robot Framework!!

*** Variables ***
### Indice da lista           0       1         2        3         4        5
@{MINHA_LISTA_DE_FRUTAS}    maça   abacaxi   banana   morango   laranja    Uva


*** Keyword ***
Usando Repeat Keyword
  
  Log to Console    ${\n} 
  Repeat Keyword    8x    Log To Console    Minha repetição da keyword!!!


Usando FOR IN RANGE
  
  Log to Console    ${\n}
  FOR  ${CONTADOR}    IN RANGE  0   5
      Log To Console    Minha posição agora é: ${CONTADOR}
      Log  Minha posição agora é: ${CONTADOR}
  END


Usando FOR IN

  Log To Console      ${\n}
  FOR   ${FRUTA}    IN    @{MINHA_LISTA_DE_FRUTAS}
      Log to Console      Minha fruta é: ${FRUTA}!
      No Operation
  END



Usando FOR IN ENUMERATE

  Log To Console      ${\n}
  FOR  ${INDICE}   ${FRUTA}    IN ENUMERATE   @{MINHA_LISTA_DE_FRUTAS}
      Log to Console      Minha fruta é: ${INDICE} --> ${FRUTA}!
      No Operation
  END


Usando FOR IN com EXIT FOR LOOP IF

  Log To Console      ${\n}
  FOR  ${INDICE}   ${FRUTA}    IN ENUMERATE   @{MINHA_LISTA_DE_FRUTAS}
      Log to Console      Minha fruta é: ${INDICE} --> ${FRUTA}!
      Exit For Loop If     '${FRUTA}'=='banana'
  END