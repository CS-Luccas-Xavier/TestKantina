Quando(/^eu selecionar um produto$/) do
  sleep(3)
  @pages = page(SelecinaritemScreen).await(timeout: 15)
  @pages.touch_product
end

Quando(/^confirmar a compra$/) do
  @pages.touch_btn_confirm_buy
end

Então(/^uma mensagem de confirmação de compra com sucesso será exibida\.$/) do
  fail "Mensagem não foi exibida" unless @pages.check_msg_sucess_buy
end

Quando(/^cancelar a compra$/) do
  @pages.touch_btn_cancel_buy
end

Então(/^o produto não será comprado$/) do
    if(@pages.check_msg_sucess_buy)
      fail 'Mensagem foi exibida incorretamente'
    end
end
