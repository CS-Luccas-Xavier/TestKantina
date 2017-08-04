# language: pt
Funcionalidade: Selecionar item para compra
  Como usuario do aplicativo Kantina
  Tenho a necessidade de selecionar os produtos disponíveis na cozinha para realizar a compra.

Cenario: Realizar compra
  Dado que estou logado
  E eu estou na lista de produtos
  Quando eu realizo uma compra
  Então uma mensagem de confirmação de compra com sucesso será exibida.

Cenario: Não efetivar a compra
  Dado que estou na tela de produtos
  Quando realizo uma compra
  E cancelo a compra
  Então a compra não é efetivada
