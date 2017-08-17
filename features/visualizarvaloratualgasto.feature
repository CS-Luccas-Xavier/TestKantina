# language: pt
Funcionalidade: Visualizar valores referente ao mês atual e data de fechamento
  Como usuario do aplicativo Kantina
  Preciso visualizar o valor das compras realizadas referente ao mês vigente.

Cenario: Verificar valor atual quando não existir compra
    Dado que estou logado
    Quando não compro nenhum produto
    Então meu valor atual gasto estará zerado no padrão correto
