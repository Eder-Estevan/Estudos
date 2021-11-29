*** Settings ***
Documention         Suite para exemplificar o suao de IF nos testes
...                 O IF deve ser pouco utilizado, mas tem hora que nçao tem jeito
...                 e precisamos dele, entaõ vams ver como é!
...                 IF: use com moderação!


Resource            ../resource/Resource_29_DecisaoCondiçãoIF.robot


*** Test Case ***

Caso de teste exemplo 01
  Rodando uma keyword dada uma condição = True
  Rodando uma keyword dada uma condição = False
  Armazenando um valor em uma variavel dada uma condição
