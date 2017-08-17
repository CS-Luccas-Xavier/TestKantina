

Então(/^o valor permanecerá o mesmo$/) do
  fail 'O valor foi alterado.' unless @pages.check_same_actual_value
end

#-----

Dado(/^que minha última compra tenha sido realizada em menos de (\d+)hrs$/) do |arg1|
  @pages = page(DeletarcompraScreen).await(timeout: 5)
  @pages.add_recently_purchase
end

Quando(/^cancelo essa compra$/) do
  @pages = page(DeletarcompraScreen).await(timeout: 5)
  @pages.keep_list_products
  @pages.long_touch_product_to_delete
  @pages.touch_confirm_delete
end

Então(/^minha compra é removida da fatura$/) do
  fail 'Compra não removida corretamente.' unless @pages.check_deleted_product
end

Então(/^visualizo uma mensagem informando que a compra foi excluída$/) do
  fail 'Mensagem de sucesso não foi exibida' unless @pages.check_msg_successful
end

Quando(/^desisto de cancelar essa compra$/) do
  @pages = page(DeletarcompraScreen).await(timeout: 5)
  @pages.keep_list_products
  @pages.long_touch_product_to_delete
  @pages.touch_cancel_delete
end

Então(/^minha fatura permanece com essa compra$/) do
  fail 'Produto foi removido sem necessidade.' unless @pages.check_qt_products
end

Então(/^o valor da minha fatura é atualizado$/) do
  fail 'Novo valor atual está incorreto.' unless @pages.check_new_actual_value
end

Dado(/^que minha última compra tenha sido realizada a mais de (\d+)hrs$/) do |arg1|
  @pages = page(DeletarcompraScreen).await(timeout: 5)
  @pages.add_old_purchase
end

Quando(/^cancelo essa compra antiga$/) do
  @pages = page(DeletarcompraScreen).await(timeout: 5)
  @pages.keep_list_products
  @pages.long_touch_last_purchase
  @pages.touch_confirm_delete
end

Então(/^sou alertado que o tempo de cancelamento expirou$/) do
  fail 'Mensagem de erro ao excluir não foi exibida' unless @pages.check_msg_error_delete
end
