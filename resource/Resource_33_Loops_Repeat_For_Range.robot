*** Settings ***
Documentation    Vamos aprender a fazer LOOPS usuando o robot Framework!!

*** Variables ***
### Indice da lista           0       1         2        3         4
@{MINHA_LISTA_DE_FRUTAS}    maça   abacaxi   banana   morango   laranja


*** Keyword ***
Usando Repeat Keyword
  Log to Console    ${\n}
  Repeat Keyword    4x    Log To Console    Minha repetição da keyword!!!


Usando FOR IN RANGE
  Log to Console    ${\n}
  FOR  ${CONTADOR}    IN  RANGE  0  5
      Log To Console    Minha posição agora é: ${CONTADOR}
      Log  Minha posição agora é: ${CONTADOR}
  END
