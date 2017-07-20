# language: pt
Funcionalidade: Acessar menu para realizar Log Out
  Como usuario do aplicativo Kantina
  Preciso sair com o login da minha conta atual.

Cenario: Realizar log out da conta logada atualmente
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de fatura
  Quando acessar o menu de opções
  E tocar na opcao de Log Out
  Então serei redirecionado para a pagina inicial
