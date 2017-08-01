# language: pt
Funcionalidade: Selecionar item para compra
  Como usuario do aplicativo Kantina
  Preciso realizar login para realizar a compra de produtos.

Contexto:
  Dado que a aplicação esteja na página de login

Cenario: Logar com usuário inválido Ex: @gmail
  Quando eu tocar para realizar login
  E escolher uma conta inválida
  Então uma mensagem será exibida informando a máscara correta

Cenario: Logar com usuário válido @concrete
  Quando eu tocar para realizar login
  E escolher a conta válida
  Então a página de fatura será carregada.

Cenario: Tentar realizar login sem conexão com a internet
  Dado que o celular esteja em modo avião
  Quando eu tocar para realizar login
  E escolher a conta válida
  Então uma mensagem será exibida informando que o celular está sem conexão
