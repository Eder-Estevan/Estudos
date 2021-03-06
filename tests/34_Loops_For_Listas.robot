*** Settings ***
Documentation      Vamos aprender a fazer LOOPS usuando o robot Framework!!
Resource           ../resource/Resource_34_Loops_For_Listas.robot


# *** Variables ***
# ### Indice da lista           0       1         2        3         4
# @{MINHA_LISTA_DE_FRUTAS}    maça   abacaxi   banana   morango   laranja


*** Test Case ***

# Teste de REPEAT KEYWORD
#   [Tags]  Repeat1

#   [Documentation]   Chama uma mesma KEYWORD várias vezes
#   Usando Repeat Keyword

# Teste de For do tipo IN RANGE
#   [Tags]  ForInRange1
  
#   [Documentation]  Faz um loop dentro de um intervaloqeu voce passar
#   Usando FOR IN RANGE

Teste de FOR de tipo IN
    [Tags]  ForInLista1

    [Documentation]     Faz um loop percorrendo a lista que você passar
    Usando FOR IN

Teste de FOR do tipo IN ENUMERATE
    [Tags]  ForInEnumerate1

    [Documentation]     Faz um loop percorrendo a lista que você passar e percorre o indice da lista
    Usando FOR IN ENUMERATE


Teste de Sair do For
    [Tags]   ForInExit1

    [Documentation]     Você controla quando o FOR deve se encerrar antes de terminar todos os LOOPS
    Usando FOR IN com EXIT FOR LOOP IF

#

