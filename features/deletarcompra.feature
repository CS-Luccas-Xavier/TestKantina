# language: pt
Funcionalidade: Deletar compra realizada (Cancelamento)
  Como usuario do aplicativo Kantina
  Preciso cancelar um produto que desisti de compra-lo.

Cenario: Validar remoção de item da lista ao cancelar compra efetuada
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de fatura
  E exista um produto que foi comprado a menos de 24 horas
  Quando eu cancelo uma compra
  Então o produto será removido da lista

Cenario: Validar mensagem (Toast) ao cancelar compra
  Dado que a aplicação esteja na página de fatura
  E exista um produto que foi comprado a menos de 24 horas
  Quando eu cancelo uma compra
  Então uma mensagem informará que o item foi deletado com sucesso

Cenario: Desistir de cancelar uma compra (Cancelar msg de confirmação)
  Dado que a aplicação esteja na página de fatura
  E exista um produto que foi comprado a menos de 24 horas
  Quando eu desistir de cancelar uma compra
  Então o produto permanecerá na lista
  E o valor permanecerá o mesmo

Cenario: Validar correção de valor atual após remover item
  Dado que a aplicação esteja na página de fatura
  E exista um produto que foi comprado a menos de 24 horas
  Quando eu cancelo uma compra
  Então o valor da fatura atual será atualizado

Cenário: Cancelamento inválido da compra
  Dado que a aplicação esteja na página de fatura
  E exista um produto que foi comprado a mais de 24 horas
  Quando eu cancelo uma compra que foi efetuada mais de 24h atrás
  Então recebo uma mensagem que não é possivel cancelar esse produto

Cenario: Validar cancelar compra sem conexão com a internet
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de fatura
  E exista um produto que foi comprado a menos de 24 horas
  E que o celular esteja em modo avião
  Quando eu cancelo uma compra
  Então uma mensagem será exibida informando que o celular está sem conexão
