# language: pt
Funcionalidade: Visualizar Produtos
  Como usuario do aplicativo Kantina
  Tenho a necessidade de ver a lista de produtos disponíveis na cozinha

Contexto:
    Dado que estou logado

Cenario: Verificar dados do produto na lista
    Quando eu acesso a lista de produtos
    Então visualizo produtos com descrição, nome e categoria

@bug
Cenario: Verificar ordenação dos produtos
    Quando eu acesso a lista de produtos
    Então visualizo os produtos em ordem alfabética

@wifi
Cenario: Carregar lista de produtos sem conexão a internet
    Dado que eu esteja sem conexão
    Quando eu acesso a lista de produtos
    Então sou informado que não existe conexão com a internet
