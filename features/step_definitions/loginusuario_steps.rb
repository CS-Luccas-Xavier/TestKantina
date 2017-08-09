Dado(/^que a aplicação esteja na página de login$/) do
  sleep(3)
  @pages = page(LoginusuarioScreen).await(timeout: 5)
end

Quando(/^eu tocar para realizar login$/) do
  @pages.touch_btn_login
end

Quando(/^escolher a conta válida$/) do
  @pages.touch_valid_email
end

Então(/^a página de fatura será carregada\.$/) do
  @pages = page(VisualizarvaloratualgastoScreen).await(timeout: 15)
  fail "Página não carregada, componente não existe" unless @pages.check_visible_actual_value
end

Quando(/^escolher uma conta inválida$/) do
  @pages.touch_invalid_email
end

Então(/^uma mensagem será exibida informando a máscara correta$/) do
  fail "Mensagem de erro diferente do esperado" unless @pages.check_msg_invalid_user
end


Dado(/^que o celular esteja em modo avião$/) do
  @pages.turn_onoff_airplane_mode
end

Então(/^uma mensagem será exibida informando que o celular está sem conexão$/) do
  validar_msg = @pages.check_internet
  @pages.turn_onoff_airplane_mode
  fail "Mensagem de erro de conexão não foi exibida" unless validar_msg 
end
