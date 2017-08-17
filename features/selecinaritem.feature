# language: pt
Funcionalidade: Selecionar item para compra
  Como usuario do aplicativo Kantina
  Tenho a necessidade de selecionar os produtos disponíveis na cozinha para realizar a compra.

Contexto:
  Dado que estou logado
  E que acesso a tela de lista de produtos

Cenario: Realizar compra com sucesso
  Quando realizo uma compra
  Então sou informado que a compra foi realizada com sucesso.

Cenario: Não efetivar a compra
  Quando tento comprar, mas não confirmo a compra do produto
  Então a compra não é efetivada

Cenario: Comprar sem conexão com a internet
  Dado que eu esteja sem conexão
  Quando realizo uma compra
  Então sou informado que não existe conexão com a internet
