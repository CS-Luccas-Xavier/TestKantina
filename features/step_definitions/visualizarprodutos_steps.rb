Dado(/^que a aplicação esteja na página de lista de produtos$/) do
  sleep(3)
  @pages = page(VisualizarvaloratualgastoScreen).await(timeout: 5)
  @pages.touch_btn_purchase
end

Quando(/^eu verificar se existe um produto na tela$/) do
  @pages = page(VisualizarprodutosScreen).await(timeout: 5)
  fail 'Item não encontrado na tela' unless @pages.check_products_page
end

Então(/^validaremos se o item possui a descrição, valor e categoria\.$/) do
  fail "Descrição do produto não encontrada" unless @pages.check_desc_prod
  fail "Preço do produto não encontrado" unless @pages.check_value_prod
end

Quando(/^eu verificar se existe mais de um produto na tela$/) do
  @pages = page(VisualizarprodutosScreen).await(timeout: 5)
  fail "Não existe mais de um produto na tela" unless @pages.check_qt_itens
end

Então(/^os produtos exibidos deverão estar em ordem alfabética\.$/) do
  fail "Ordenação incorreta" unless @pages.check_orderby_name_screen
end

Quando(/^eu acessar a lista de produtos$/) do
  @pages.touch_btn_purchase
end
