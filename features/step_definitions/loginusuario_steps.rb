Dado(/^que eu esteja sem conexão$/) do
  @pages.turn_onoff_airplane_mode
end

Dado(/^que eu estou na tela de login$/) do
  sleep(3)
  @pages = page(AndroidScreenBase)
  if(@pages.require_login)
    @pages = page(LoginusuarioScreen).await(timeout: 5)
  end
end

Quando(/^eu logar com uma conta inválida$/) do
  @pages.touch_btn_login
  @pages.touch_invalid_email
end

Então(/^visualizo a mensagem para logar com o provedor correto$/) do
  fail "Mensagem de erro diferente do esperado" unless @pages.check_msg_invalid_user
end

Quando(/^eu logar com uma conta da concrete$/) do
  @pages.touch_btn_login
  @pages.touch_valid_email
end

Então(/^visualizo a tela principal$/) do
  @pages = page(VisualizarvaloratualgastoScreen).await(timeout: 15)
  fail "Página não carregada, componente não existe" unless @pages.check_visible_actual_value
end

Então(/^sou informado que não existe conexão com a internet$/) do
  validar_msg = @pages.check_internet
  @pages.turn_onoff_airplane_mode
  fail "Mensagem de erro de conexão não foi exibida" unless validar_msg
end
