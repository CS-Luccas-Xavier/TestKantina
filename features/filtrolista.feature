# language: pt
Funcionalidade: Filtrar item para compra
  Como usuario do aplicativo Kantina
  Preciso realizar filtro na pagina de compra de produtos para encontrar os itens mais facilmente.

Cenario: Tentar filtrar item que não possui resultado.
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de lista de produtos
  Quando eu acessar o item de filtro
  E preencher com um valor que não retornará nenhum produto
  Então uma mensagem que Nenhum resultado foi encontrado deverá ser aprensetada

Cenario: Filtrar item que possui acentos
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de lista de produtos
  Quando eu acessar o item de filtro
  E pesquisar por um produto que possui acento, mas sem utiliza-lo
  Então o produto deverá ser exibido na tela

Cenario: Filtrar item com letra maiúscula/minúscula
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de lista de produtos
  Quando eu acessar o item de filtro
  E pesquisar por um produto com letras maiúsculas e minúsculas
  Então o produto deverá ser exibido na tela

Cenario: Limpar campo de busca
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de lista de produtos
  Quando eu acessar o item de filtro
  E preencher o campo com algum valor
  E clicar no X para limpar o filtro
  Então todos os produtos deverão aparecer na tela.

Cenario: Seta deverá desaparecer ao iniciar filtro
  Dado que o usuário tenha logado com sucesso
  E que a aplicação esteja na página de lista de produtos
  Quando eu acessar o item de filtro
  Então a seta para voltar para outra página deverá sumir
