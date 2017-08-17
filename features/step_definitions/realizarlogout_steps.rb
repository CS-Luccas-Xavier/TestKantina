Dado(/^que estou logado$/) do
  @pages = page(AndroidScreenBase)
  if(@pages.require_login)
    @pages = page(LoginusuarioScreen).await(timeout: 5)
    @pages.touch_btn_login
    @pages.touch_valid_email
    sleep(2)
  end
end

Quando(/^faço o Logout do aplicativo$/) do
  @pages = page(RealizarlogoutScreen).await(timeout: 5)
  @pages.touch_btn_menu
  @pages.touch_btn_logout
end

Então(/^visualizo a tela de login$/) do
  @pages = page(LoginusuarioScreen).await(timeout: 5)
  @pages.check_btn_login_visible
end
