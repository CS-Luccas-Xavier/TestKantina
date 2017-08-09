# language: pt
Funcionalidade: Acessar menu para realizar Logout
  Como usuario do aplicativo Kantina
  Preciso desconectar da minha conta atual.

Cenario: Realizar log out da conta logada
  Dado que eu estou logado
  Quando faço o Logout do aplicativo
  Então visualizo a tela de login
