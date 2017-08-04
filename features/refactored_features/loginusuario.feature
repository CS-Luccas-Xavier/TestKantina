# language: pt
Funcionalidade: Selecionar item para compra
  Como usuario do aplicativo Kantina
  Preciso realizar login para realizar a compra de produtos.

Contexto:
  Dado que eu esteja na tela de login
  
Cenario: Login com provedor inválido
  Quando eu logar com uma conta inválida
  Então visualizo a mensagem para logar com o provedor correto

Cenario: Login com provedor válido
  Quando eu logar com uma conta da concrete
  Então visualizo a tela de fatura
