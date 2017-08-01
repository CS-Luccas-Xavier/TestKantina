# language: pt
Funcionalidade: Acessar menu para realizar Log Out
  Como usuario do aplicativo Kantina
  Preciso sair com o login da minha conta atual.

Cenario: Sair da conta (logout).
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de fatura
  Quando acessar o menu de opções
  E tocar na opcao de Log Out
  Então serei redirecionado para a pagina inicial

Cenario: Sair da conta (logout) sem conexão com a internet.
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de fatura
  E que o celular esteja em modo avião
  Quando acessar o menu de opções
  E tocar na opcao de Log Out
  Então uma mensagem será exibida informando que o celular está sem conexão
