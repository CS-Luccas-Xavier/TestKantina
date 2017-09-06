## language: pt
#Funcionalidade: Exibir estatísticas do usuário
#  Como usuario do aplicativo Kantina
#  Tenho a opção de visualizar algumas estatísticas de consumo

#Contexto:
#  Dado que estou logado

#@graphic
#Cenario: Exibir gráfico de pizza dos produtos mais comprados corretamente
#  E que tenha algumas compras para gerar o gráfico
#  Quando eu acesso o menu de estatísticas
#  Então meu gráfico de mais produtos comprados é exibido corretamente

#Cenario: Exibir gráfico de barra das categorias dos produtos comprados corretamente
#  E que tenha algumas compras para gerar o gráfico
#  Quando eu acesso o menu de estatísticas
#  Então meu gráfico da categoria dos produtos comprados é exibido corretamente

#Cenario: Exibir mensagem quando não houver dados suficientes para as estatísticas
#  E que não tenha compras suficientes para gerar as estatísticas
#  Quando eu acesso o menu de estatísticas
#  Então uma mensagem é exibida informando que não possuo dados suficientes
