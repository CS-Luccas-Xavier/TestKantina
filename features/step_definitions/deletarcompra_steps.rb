Quando(/^eu cancelo uma compra$/) do
  @pages = page(DeletarcompraScreen).await(timeout: 5)
  @pages.keep_list_products
  @pages.long_touch_product_to_delete
  @pages.touch_confirm_delete
end

Então(/^o produto será removido da lista$/) do
  @pages.check_deleted_product
end

Então(/^uma mensagem informará que o item foi deletado com sucesso$/) do
  fail 'Mensagem de sucesso não foi exibida' unless @pages.check_msg_successful
end

Quando(/^eu desistir de cancelar uma compra$/) do
  @pages = page(DeletarcompraScreen).await(timeout: 5)
  @pages.keep_list_products
  @pages.long_touch_product_to_delete
  @pages.touch_cancel_delete
end

Então(/^o produto permanecerá na lista$/) do
  @pages.check_qt_products
end

Então(/^o valor permanecerá o mesmo$/) do
  fail 'O valor foi alterado.' unless @pages.check_same_actual_value
end

Então(/^o valor da fatura atual será atualizado$/) do
  fail 'Novo valor atual está incorreto.' unless @pages.check_new_actual_value
end

Quando(/^eu cancelo uma compra que foi efetuada mais de (\d+)h atrás$/) do |arg1|
  @pages = page(DeletarcompraScreen).await(timeout: 5)
  @pages.keep_list_products
  @pages.long_touch_last_purchase
  @pages.touch_confirm_delete
end

Então(/^recebo uma mensagem que não é possivel cancelar esse produto$/) do
  fail 'Mensagem de erro ao excluir não foi exibida' unless @pages.check_msg_error_delete
end

Dado(/^exista um produto que foi comprado a menos de (\d+) horas$/) do |arg1|
  @pages = page(DeletarcompraScreen).await(timeout: 5)
  @pages.add_recently_purchase
end

Dado(/^exista um produto que foi comprado a mais de (\d+) horas$/) do |arg1|
  @pages = page(DeletarcompraScreen).await(timeout: 5)
  @pages.add_old_purchase
end
