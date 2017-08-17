# language: pt
Funcionalidade: Visualizar valores referente ao mês passado (fechado)
  Como usuario do aplicativo Kantina
  Preciso visualizar o valor das compras realizadas no mês passado e que serão pagos.

Cenario: Verificar se valor fechado está sendo exibido
    Dado que estou logado
    Quando eu fechar a minha fatura
    Então visualizo o valor das minhas compras do mês passado
