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
  @pages = page(VisualizarvaloratualgastoScreen).await(timeout: 5)
  fail 'Mensagem não exibida' unless @pages.check_zero_purchase
end

Quando(/^existam mais de uma compra em datas diferentes$/) do
  system("curl -X PUT -d '{ \"buyDate\": 1498939416000, \"firebasePushID\": \"321123\", \"productCategory\": \"Bebida\", \"productName\": \"TESTE LUCCAS\", \"productPrice\": 123.45, \"userDisplayName\": \"Luccas Xavier\" }' 'https://kantina-3606f.firebaseio.com/usuarios/Luccas Xavier/compras/321123.json'")
  system("curl -X PUT -d '{ \"buyDate\": 1500062616000, \"firebasePushID\": \"123456\", \"productCategory\": \"Comida\", \"productName\": \"LUCCAS PRODUCTS\", \"productPrice\": 654.32, \"userDisplayName\": \"Luccas Xavier\" }' 'https://kantina-3606f.firebaseio.com/usuarios/Luccas Xavier/compras/123456.json'")
end

Então(/^as compras estarão ordenadas da mais recente para mais antiga$/) do
  @pages = page(FaturaatualdetalhadaScreen).await(timeout: 5)
  @pages.check_order_by_date
end
