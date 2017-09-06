Dado(/^que tenha algumas compras para gerar o gráfico$/) do
  @pages = page(FaturaatualdetalhadaScreen).await(timeout: 5)
  @pages.delete_all_buys
end

Quando(/^eu acesso o menu de estatísticas$/) do
  @pages = page(RealizarlogoutScreen).await(timeout: 5)
  @pages.touch_btn_menu
  @pages.touch_btn_statistics
end

Então(/^meu gráfico de mais produtos comprados é exibido corretamente$/) do
  @pages = page(EstatisticasScreen).await(timeout: 5)
  diff_metric = nakal_execute("statistics_screen")
end

Dado(/^que não tenha compras suficientes para gerar as estatísticas$/) do
  @pages.delete_all_buys
end

Então(/^uma mensagem é exibida informando que não possuo dados suficientes$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
