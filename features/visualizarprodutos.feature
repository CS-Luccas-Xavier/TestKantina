# language: pt
Funcionalidade: Visualizar Produtos
  Como usuario do aplicativo Kantina
  Tenho a necessidade de ver a lista de produtos disponíveis na cozinha

Cenario: Verificar se produtos estão aparecendo na lista
    Dado que o usuário tenha logado com sucesso
    E que a aplicação esteja na página de lista de produtos
    Quando eu verificar se existe um produto na tela
    Então validaremos se o item possui a descrição, valor e categoria.

Cenario: Validar ordem alfabética dos produtos
    Dado que a aplicação esteja na página de lista de produtos
    Quando eu verificar se existe mais de um produto na tela
    Então os produtos exibidos deverão estar em ordem alfabética.
