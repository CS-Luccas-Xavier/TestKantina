Então(/^visualizo minha compra na lista de itens comprados$/) do
  @pages = page(FaturaatualdetalhadaScreen).await(timeout: 5)
  sleep(1)
  fail 'Produto não inserido na tela' unless @pages.check_new_product
end

Então(/^meu valor atual total é incrementado com o valor da nova compra$/) do
  @pages = page(FaturaatualdetalhadaScreen).await(timeout: 5)
  fail 'Valor diferente do esperado' unless @pages.check_new_total_value
end

Quando(/^eu não tiver realizado nenhuma compra$/) do
  @pages.delete_all_buys
end

Então(/^sou informado que não realizei nenhuma compra no mês atual$/) do
  @pages = page(FaturaatualdetalhadaScreen).await(timeout: 5)
  fail 'Mensagem não exibida' unless @pages.check_zero_purchase
end

Quando(/^faço compras em datas diferentes$/) do
  system("curl -X PUT -d '{ \"buyDate\": 1498939416000, \"firebasePushID\": \"321123\", \"productCategory\": \"Bebida\", \"productName\": \"TESTE LUCCAS\", \"productPrice\": 123.45, \"userDisplayName\": \"Luccas Xavier\" }' 'https://kantina-3606f.firebaseio.com/desenvolvimento/usuarios/Luccas Xavier/compras/321123.json?auth=XQch1IAHNxauN9hxVx3Zq6vdmF0yuzRxYum009sn'")
  system("curl -X PUT -d '{ \"buyDate\": 1500062616000, \"firebasePushID\": \"123456\", \"productCategory\": \"Comida\", \"productName\": \"LUCCAS PRODUCTS\", \"productPrice\": 654.32, \"userDisplayName\": \"Luccas Xavier\" }' 'https://kantina-3606f.firebaseio.com/desenvolvimento/usuarios/Luccas Xavier/compras/123456.json?auth=XQch1IAHNxauN9hxVx3Zq6vdmF0yuzRxYum009sn'")
end

Então(/^visualizo minhas compras em ordem decrescente por data de compra$/) do
  @pages = page(FaturaatualdetalhadaScreen).await(timeout: 5)
  @pages.check_order_by_date
end

Dado(/^guardo o produto que vou comprar$/) do
  @pages.set_product_name
end

Dado(/^guardo o antigo valor atual$/) do
  @pages.set_old_value
end
