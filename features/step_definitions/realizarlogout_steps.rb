Quando(/^acessar o menu de opções$/) do
  @pages = page(RealizarlogoutScreen).await(timeout: 5)
  @pages.touch_btn_menu
end

Quando(/^tocar na opcao de Log Out$/) do
  @pages.touch_btn_logout
end

Então(/^serei redirecionado para a pagina inicial$/) do
  @pages = page(LoginusuarioScreen).await(timeout: 5)
  @pages.check_btn_login_visible
end
