# language: pt
Funcionalidade: Visualizar o status da fatura
  Como usuario do aplicativo Kantina
  Preciso visualizar o status de pagamento da minha fatura (pendente ou pago).

Contexto:
  Dado que eu estou lojado

Cenario: Pagar fatura do mês anterior
  Quando realizo o pagamento da fatura do mês anterior
  Então meu status de pagamento é mostrado como pago

Cenario: Fatura do mês anterior aberta
  Quando a fatura do mês anterior ainda não tiver sido paga
  Então meu status de pagamento é mostrado como aberto
