Então(/^a tela volta para a pagina de fatura$/) do
  @pages = page(VisualizarvaloratualgastoScreen).await(timeout: 5)
  fail 'Página de fatura não foi carregada' unless @pages.check_visible_actual_value
end

Então(/^o item é adicionado na lista da fatura atual$/) do
  @pages = page(FaturaatualdetalhadaScreen).await(timeout: 5)
  fail 'Produto não inserido na tela' unless @pages.check_new_product
end

Então(/^o valor atual total é incrementado com o valor do produto comprado$/) do
  @pages = page(FaturaatualdetalhadaScreen).await(timeout: 5)
  fail 'Valor diferente do esperado' unless @pages.check_new_total_value
end

Então(/^uma mensagem será exibida para confirmar que não existe compra no mês atual$/) do
  fail 'Mensagem não exibida' unless @pages.check_zero_purchase
end

Quando(/^existam mais de uma compra em datas diferentes$/) do
  system("curl -X POST -d '{ \"buyDate\": \"01/07/17\", \"productCategory\": \"Bebida\", \"productName\": \"TESTE LUCCAS\", \"productPrice\": 123.45, \"userEmail\": \"Luccas Xavier\" }' 'https://kantina-3606f.firebaseio.com/usuarios/Luccas Xavier/compras.json'")
  system("curl -X POST -d '{ \"buyDate\": \"09/07/17\", \"productCategory\": \"Comida\", \"productName\": \"LUCCAS PRODUCTS\", \"productPrice\": 654.32, \"userEmail\": \"Luccas Xavier\" }' 'https://kantina-3606f.firebaseio.com/usuarios/Luccas Xavier/compras.json'")
end

Então(/^as compras estarão ordenadas da mais recente para mais antiga$/) do
  @pages = page(FaturaatualdetalhadaScreen).await(timeout: 5)
  @pages.check_order_by_date
end
