Dado(/^que a aplicação esteja na página de fatura$/) do
  sleep(2)
  @pages = page(VisualizarvaloratualgastoScreen).await(timeout: 5)
  @pages.keep_actual_value
end

Dado(/^não existam compras cadastradas para esse usuário$/) do
  @pages.delete_all_buys
end

Quando(/^eu verificar se o campo de valor está sendo exibido$/) do
  fail "Campo não está aparecendo." unless @pages.check_visible_actual_value
end

Então(/^validaremos se o valor está informado corretamente \(zero\)\.$/) do
  fail "Valor inválido" unless @pages.check_content_actual_value
end

#Quando(/^eu verificar se o campo da data de fechamento está preenchida$/) do
#  fail "Data fechamento não existe." unless @pages.check_closing_date
#end

#Então(/^a data de fechamento deverá ser a do último dia do mês vigente\.$/) do
#  fail "A data de fechamento está diferente da esperada." unless @pages.check_content_closing_date
#end
