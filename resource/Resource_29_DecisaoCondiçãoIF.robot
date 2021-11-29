*** Settings ***
Documention         Suite para exemplificar o suao de IF nos testes
...                 O IF deve ser pouco utilizado, mas tem hora que nçao tem jeito
...                 e precisamos dele, entaõ vams ver como é!
...                 IF: use com moderação!


*** Variable ***
@{FRUTAS}  maça   banana   uva   abacaxi




*** Keyword ***

Rodando uma keyword dada uma condição = True
  Run Keyword If    '${FRUTAS[1]}' == 'banana'        Log    O item número 1 é a banana!

Rodando uma keyword dada uma condição = False
  Run Keyword Unless    '${FRUTAS[1]}' == 'maça'      Log    O item número 1 não é uma maça!

Armazenando um valor em uma variavel dada uma condição
  ${VAR}    Set Variable If    '${FRUTAS[2]}'   == 'uva'      uva
  Log       Minha variavel VAR é uma ${VAR}!!
