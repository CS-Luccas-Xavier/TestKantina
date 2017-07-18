# language: pt
Funcionalidade: Visualizar valores referente ao mês atual e data de fechamento
  Como usuario do aplicativo Kantina
  Preciso visualizar o valor das compras realizadas referente ao mês vigente.


Cenario: Verificar se valor atual carregará com valor zerado quando não existir nenhuma compra
    Dado que o usuário tenha logado com sucesso
    E que a aplicação esteja na página de fatura
    E não existam compras cadastradas para esse usuário
    Quando eu verificar se o campo de valor está sendo exibido
    Então validaremos se o valor está informado corretamente (zero).

#Cenario: Validar data de fechamento da fatura
#    Dado que a aplicação esteja na página de fatura
#    Quando eu verificar se o campo da data de fechamento está preenchida
#    Então a data de fechamento deverá ser a do último dia do mês vigente.
