# language: pt
Funcionalidade: Selecionar item para compra
  Como usuario do aplicativo Kantina
  Tenho a necessidade de selecionar os produtos disponíveis na cozinha para realizar a compra.

Cenario: Selecionar produto e confirmar a compra
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de lista de produtos
  Quando eu selecionar um produto
  E confirmar a compra
  Então uma mensagem de confirmação de compra com sucesso será exibida.

Cenario: Selecionar produto e cancelar a compra
  Dado que a aplicação esteja na página de lista de produtos
  Quando eu selecionar um produto
  E cancelar a compra
  Então o produto não será comprado
