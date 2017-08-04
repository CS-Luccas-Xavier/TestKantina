# language: pt
Funcionalidade: Visualizar o status da fatura
  Como usuario do aplicativo Kantina
  Preciso visualizar o status de pagamento da minha fatura.

Cenario: Pagar fatura
  Dado que eu esteja lojado no aplicativo
  Quando realizo o pagamento da fatura do mês anterior
  Então meu status de pagamento é mostrado como pago

Cenario: Fatura aberta
  Dado que estou na tela de fatura
  Quando fecho a fatura do mês atual
  Então meu status de pagamento é mostrado como em aberto
