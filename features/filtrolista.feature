# language: pt
Funcionalidade: Filtrar item para compra
  Como usuario do aplicativo Kantina
  Preciso realizar filtro na pagina de compra de produtos para encontrar os itens mais facilmente.

Contexto:
  Dado que estou logado
  E que acesso a tela de lista de produtos

@bug
Cenario: Filtrar produto inexistente.
  Quando eu pesquiso um produto inexistente
  Então sou informado que não existe nenhum produto com aquele nome

Cenario: Filtrar item que possui acentos
  Quando eu filtrar um produto que possua acento, e não utiliza-lo
  Então visualizo o produto na tela

Cenario: Filtrar item com letra maiúscula/minúscula
  Quando eu filtrar um poduto com letra maiúsculas e minúsculas
  Então visualizo o produto na tela

Cenario: Limpar campo de busca
  Quando eu filtrar algum produto
  E clicar no botão X
  Então visualizo todos os produtos na tela
