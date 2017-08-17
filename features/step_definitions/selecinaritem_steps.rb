Dado(/^que acesso a tela de lista de produtos$/) do
  @pages = page(VisualizarvaloratualgastoScreen).await(timeout: 10)
  @pages.touch_btn_purchase
end

Quando(/^realizo uma compra$/) do
  @pages = page(SelecinaritemScreen).await(timeout: 15)
  @pages.touch_product
  @pages.touch_btn_confirm_buy
end

Então(/^sou informado que a compra foi realizada com sucesso\.$/) do
  fail "Mensagem não foi exibida" unless @pages.check_msg_sucess_buy
end

Quando(/^tento comprar, mas não confirmo a compra do produto$/) do
  @pages = page(SelecinaritemScreen).await(timeout: 15)
  @pages.touch_product
  @pages.touch_btn_cancel_buy
end

Então(/^a compra não é efetivada$/) do
  if(@pages.check_msg_sucess_buy)
    fail 'Mensagem foi exibida incorretamente'
  end
end
