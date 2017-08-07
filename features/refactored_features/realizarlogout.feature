# language: pt
Funcionalidade: Acessar menu para realizar Log Out
  Como usuario do aplicativo Kantina
  Preciso sair com o login da minha conta atual.

Cenario: Realizar log out da conta logada atualmente
  Dado que eu esteja logado
  Quando faço o LogOut do aplicativo
  Então visualizo a tela de login
