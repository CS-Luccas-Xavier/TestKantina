# language: pt
Funcionalidade: Visualizar valores referente ao mês atual e data de fechamento
  Como usuario do aplicativo Kantina
  Preciso visualizar o valor das compras realizadas referente ao mês vigente.


Cenario: Verificar se valor atual carregará com valor zerado quando não existir nenhuma compra
    Dado que eu esteja logado
    Quando não compro nenhum produto
    Então meu valor atual gasto estará zerado

