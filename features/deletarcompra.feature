# language: pt
Funcionalidade: Deletar compra realizada (Cancelamento)
  Como usuario do aplicativo Kantina
  Preciso cancelar um produto que desisti de compra-lo.

Contexto:
  Dado que estou logado

Cenario: Remover produto comprado da lista de fatura
  E que minha última compra tenha sido realizada em menos de 24hrs
  Quando cancelo essa compra
  Então minha compra é removida da fatura

Cenario: Validar mensagem (Toast) ao cancelar compra
  E que minha última compra tenha sido realizada em menos de 24hrs
  Quando cancelo essa compra
  Então visualizo uma mensagem informando que a compra foi excluída

Cenario: Desistir de cancelar uma compra (Cancelar msg de confirmação)
  E que minha última compra tenha sido realizada em menos de 24hrs
  Quando desisto de cancelar essa compra
  Então minha fatura permanece com essa compra

Cenario: Validar valor atual após remover item
  E que minha última compra tenha sido realizada em menos de 24hrs
  E guardo o antigo valor atual
  Quando cancelo essa compra
  Então o valor da minha fatura é atualizado

Cenário: Cancelamento inválido da compra
  E que minha última compra tenha sido realizada a mais de 24hrs
  Quando cancelo essa compra antiga
  Então sou alertado que o tempo de cancelamento expirou

@wifi
Cenario: Cancelar compra sem conexão com a internet
  E que minha última compra tenha sido realizada em menos de 24hrs
  E que eu esteja sem conexão
  Quando cancelo essa compra
  Então sou informado que não existe conexão com a internet
