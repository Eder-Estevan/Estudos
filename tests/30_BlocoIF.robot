A partir da versão do Robot Framework 4.0 existe um novo jeito de fazer IFs! Segue abaixo a nova sintaxe básica com apenas o bloco IF:



*** Test Cases ***
Exemplo bloco IF
   IF   ${status} > 0
        Some keyword
        Another keyword
   END


Diferente da keyword Run Keyword If ensinada na aula anterior, nesse novo formato você pode chamar quantas keywords quiser ali dentro do bloco, se a condição for VERDADEIRA, ele executará todas as keywords ali declaradas. Importante: não se esqueça de finalizar o bloco com o END!

http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#if-expression
