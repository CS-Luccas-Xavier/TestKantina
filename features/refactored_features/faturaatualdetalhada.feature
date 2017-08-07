# language: pt
Funcionalidade: Visualizar os produtos da fatura atual
  Como usuario do aplicativo Kantina
  Preciso visualizar os produtos da minha fatura atual

Cenario: Atualizar lista de itens comprados.
  Dado que eu esteja logado
  E acesso a tela de lista de produtos
  Quando realizo uma compra
  Então visualizo minha compra na lista de itens comprados

Cenario: Valor da fatura atualizado por nova compra.
  Dado que eu esteja na tela de lista de produtos
  Quando realizo uma compra
  Então meu valor atual total é incrementado com o valor da nova compra

Cenario: Lista de compras vazia.
  Dado que eu esteja na tela de fatura
  Quando eu não tiver realizado nenhuma compra
  Então sou informado que não realizei nenhuma compra no mês atual

Cenario: Compras sendo exibidas em ordem decrescente por data.
  Dado que eu esteja na tela de fatura
  Quando faço compras em datas diferentes
  Então visualizo minhas compras em ordem decrescente por data