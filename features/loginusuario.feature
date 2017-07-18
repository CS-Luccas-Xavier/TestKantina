# language: pt
Funcionalidade: Selecionar item para compra
  Como usuario do aplicativo Kantina
  Preciso realizar login para realizar a compra de produtos.

Cenario: Logar com usuário inválido Ex: @gmail
  Dado que a aplicação esteja na página de login
  Quando eu tocar para realizar login
  E escolher uma conta inválida
  Então uma mensagem será exibida informando a máscara correta

Cenario: Logar com usuário válido @concrete
  Dado que a aplicação esteja na página de login
  Quando eu tocar para realizar login
  E escolher a conta válida
  Então a página de fatura será carregada.
