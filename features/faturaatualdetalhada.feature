# language: pt
Funcionalidade: Visualizar os produtos da fatura atual
  Como usuario do aplicativo Kantina
  Preciso visualizar os produtos da minha fatura atual

Cenario: Verificar se os itens comprados estão aparecendo na tela.
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de lista de produtos
  Quando eu selecionar um produto
  E confirmar a compra
  Então a tela volta para a pagina de fatura
  E o item é adicionado na lista da fatura atual

Cenario: Verificar se o valor total atual está igual a soma dos produtos listados.
  Dado que a aplicação esteja na página de fatura
  E que a aplicação esteja na página de lista de produtos
  Quando eu selecionar um produto
  E confirmar a compra
  Então a tela volta para a pagina de fatura
  E o valor atual total é incrementado com o valor do produto comprado

Cenario: Verificar se existe a mensagem quando não houver compras
  Dado que a aplicação esteja na página de fatura
  Quando não existam compras cadastradas para esse usuário
  Então uma mensagem será exibida para confirmar que não existe compra no mês atual

Cenario: Validar se as compras estão ordenadas por mais recente para mais antiga
  Dado que a aplicação esteja na página de fatura
  Quando existam mais de uma compra em datas diferentes
  Então as compras estarão ordenadas da mais recente para mais antiga
