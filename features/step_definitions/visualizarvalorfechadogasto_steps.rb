
Quando(/^eu verificar se o valor fechado está sendo exibido$/) do
  sleep(2)
  @pages = page(VisualizarvalorfechadogastoScreen).await(timeout: 5)
  fail "Valor fechado não está aparecendo na tela." unless @pages.check_closed_value_visible
end

Então(/^validaremos se o valor está informado corretamente$/) do
  @pages.check_content_closed_value
end

Dado(/^que o usuário tenha logado com sucesso$/) do
  @pages = page(AndroidScreenBase)
  if(@pages.require_login)
    sleep(2)
    @pages = page(LoginusuarioScreen).await(timeout: 5)
    @pages.touch_btn_login
    @pages.touch_valid_email
    sleep(2)
  end
end
