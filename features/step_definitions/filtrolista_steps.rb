Quando(/^eu acessar o item de filtro$/) do
  sleep(2)
  @pages = page(FiltrolistaScreen).await(timeout: 5)
  @pages.touch_btn_search
end

Quando(/^preencher com um valor que não retornará nenhum produto$/) do
  @pages.filter_not_exists
end

Então(/^uma mensagem que Nenhum resultado foi encontrado deverá ser aprensetada$/) do
  fail 'Mensagem não foi exibida' unless @pages.check_msg_not_exists
end

Quando(/^pesquisar por um produto que possui acento, mas sem utiliza\-lo$/) do
  @pages.filter_words_accentuation
end

Então(/^o produto deverá ser exibido na tela$/) do
  fail 'Item não exibido na tela' unless @pages.check_filter
end

Quando(/^pesquisar por um produto com letras maiúsculas e minúsculas$/) do
  @pages.filter_upcase_downcase
end

Quando(/^preencher o campo com algum valor qualquer$/) do
  @pages.enter_text_value
end

Quando(/^clicar no X para limpar o filtro$/) do
  @pages.touch_clean_btn
end

Então(/^todos os produtos deverão aparecer na tela\.$/) do
  fail 'Os produtos não apareceram corretamente.' unless @pages.check_qt_products
end

Então(/^a seta para voltar para outra página deverá sumir$/) do
  if(@pages.check_visible_return_btn)
    fail 'Botão continua visível'
  end
end
