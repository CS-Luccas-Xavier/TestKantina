Quando(/^não compro nenhum produto$/) do
  @pages = page(VisualizarvaloratualgastoScreen).await(timeout: 10)
  @pages.delete_all_buys
end

Então(/^meu valor atual gasto estará zerado no padrão correto$/) do
  fail "Valor incorreto" unless @pages.check_zero_actual_value
end
