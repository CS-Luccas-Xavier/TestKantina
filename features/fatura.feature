# language: pt
Funcionalidade: Visualizar o status da fatura
  Como usuario do aplicativo Kantina
  Preciso visualizar o status de pagamento da minha fatura.

Cenario: Verificar se minha fatura está com o status pago
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de fatura
  Quando altero o status de pagamento da minha fatura anterior no firebase para Pago
  Então meu status de pagamento é mostrado para pago

Cenario: Verificar se minha fatura está com o status em aberto
  Dado que a aplicação esteja na página de fatura
  Quando fecho a fatura do mês anterior
  Então meu status de pagamento é mostrado como em aberto
