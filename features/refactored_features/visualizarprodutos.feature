# language: pt
Funcionalidade: Visualizar Produtos
  Como usuario do aplicativo Kantina
  Tenho a necessidade de ver a lista de produtos disponíveis na cozinha

Cenario: Verificar dados do produto na lista
    Dado que estou logado
    Quando eu acesso a lista de produtos
    Então visualizo produtos com descrição, nome e categoria

Cenario: Verificar ordenação dos produtos
    Dado que estou na página de fatura
    Quando acesso a tela de produtos
    Então visualizo os produtos em ordem alfabética
