Quando(/^eu pesquiso um produto inexistente$/) do
  sleep(2)
  @pages = page(FiltrolistaScreen).await(timeout: 5)
  @pages.touch_btn_search
  @pages.filter_not_exists
end

Então(/^sou informado que não existe nenhum produto com aquele nome$/) do
  fail 'Mensagem não foi exibida' unless @pages.check_msg_not_exists
end

Quando(/^eu filtrar um produto que possua acento, e não utiliza\-lo$/) do
  sleep(2)
  @pages = page(FiltrolistaScreen).await(timeout: 5)
  @pages.touch_btn_search
  @pages.filter_words_accentuation
end

Então(/^visualizo o produto na tela$/) do
  fail 'Item não exibido na tela' unless @pages.check_filter
end

Quando(/^eu filtrar um poduto com letra maiúsculas e minúsculas$/) do
  sleep(2)
  @pages = page(FiltrolistaScreen).await(timeout: 5)
  @pages.touch_btn_search
  @pages.filter_upcase_downcase
end

Quando(/^eu filtrar algum produto$/) do
  sleep(2)
  @pages = page(FiltrolistaScreen).await(timeout: 5)
  @pages.touch_btn_search
  @pages.enter_text_value
end

Quando(/^clicar no botão X$/) do
  @pages.touch_clean_btn
end

Então(/^visualizo todos os produtos na tela$/) do
  fail 'Os produtos não apareceram corretamente.' unless @pages.check_text_search
end
