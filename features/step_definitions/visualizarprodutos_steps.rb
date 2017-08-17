Quando(/^eu acesso a lista de produtos$/) do
  sleep(3)
  @pages = page(VisualizarvaloratualgastoScreen).await(timeout: 10)
  @pages.touch_btn_purchase
end

Então(/^visualizo produtos com descrição, nome e categoria$/) do
  @pages = page(VisualizarprodutosScreen).await(timeout: 5)
  fail "Descrição do produto não encontrada" unless @pages.check_desc_prod
  fail "Preço do produto não encontrado" unless @pages.check_value_prod
end

Então(/^visualizo os produtos em ordem alfabética$/) do
  @pages = page(VisualizarprodutosScreen).await(timeout: 5)
  fail "Ordenação incorreta" unless @pages.check_orderby_name_screen
end
