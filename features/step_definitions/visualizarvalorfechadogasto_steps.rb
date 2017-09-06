Quando(/^eu fechar a minha fatura$/) do
 system("curl -X DELETE 'https://kantina-3606f.firebaseio.com/desenvolvimento/usuarios/Luccas Xavier/invoices/previous.json?auth=XQch1IAHNxauN9hxVx3Zq6vdmF0yuzRxYum009sn'")
end

Então(/^visualizo o valor das minhas compras do mês passado$/) do
  @pages = page(VisualizarvalorfechadogastoScreen).await(timeout: 10)
 fail 'Valor inválido' unless @pages.check_zero_closed_value
end
