# language: pt
Funcionalidade: Selecionar item para compra
  Como usuario do aplicativo Kantina
  Preciso realizar login para realizar a compra de produtos.

Contexto:
  Dado que eu estou na tela de login

@wifi @bug
Cenario: Tentar realizar login sem conexão com a internet
  Dado que eu esteja sem conexão
  Quando eu logar com uma conta inválida
  Então sou informado que não existe conexão com a internet

@bug
Cenario: Login com provedor inválido
  Quando eu logar com uma conta inválida
  Então visualizo a mensagem para logar com o provedor correto

Cenario: Login com provedor válido
  Quando eu logar com uma conta da concrete
  Então visualizo a tela principal
