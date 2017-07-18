# language: pt
Funcionalidade: Visualizar valores referente ao mês passado (fechado)
  Como usuario do aplicativo Kantina
  Preciso visualizar o valor das compras realizadas no mês passado e que serão pagos.

Cenario: Verificar se valor fechado está sendo exibido
    Dado que o usuário tenha logado com sucesso
    E que a aplicação esteja na página de fatura
    Quando eu verificar se o valor fechado está sendo exibido
    Então validaremos se o valor está informado corretamente
