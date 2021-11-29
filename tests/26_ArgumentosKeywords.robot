*** Settings ***

Documentation      Exempplo de usoa de vriaveis como argumentos em keywords
Resource                  ../resource/Resource_26_ArgumentosKeywords.robot

# *** Variable ***
# &{PESSOA}   nome=May Fernadndes     email=mayfernandes@exemplo.com.br    idade=12     sexo=feminino


***Test Case ***
# Caso de teste de exemplo 01
#
#   Uma keyword qualquer 01


Caso de teste Tarefa 04 praticando Keywords com argumentos: Email customizado
  Customizar qualquer email

  # Informar "Primeiro nome"
  # Informar "sobrenome"
  # Informar "string aleatoria"
  # Receber o email padrão
