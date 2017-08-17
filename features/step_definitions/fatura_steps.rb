Quando(/^realizo o pagamento da fatura do mês anterior$/) do
  @pages = page(FaturaScreen).await(timeout: 5)
  @pages.invoice_true
end

Então(/^meu status de pagamento é mostrado como pago$/) do
  fail "Ícone não exibido na tela." unless @pages.check_image_status_visible
  fail "Imagem inválida (Esperado: (V))." unless @pages.check_status_paid
end

Quando(/^a fatura do mês anterior ainda não tiver sido paga$/) do
  @pages = page(FaturaScreen).await(timeout: 5)
  @pages.invoice_false
end

Então(/^meu status de pagamento é mostrado como aberto$/) do
  fail "Ícone não exibido na tela." unless @pages.check_image_status_visible
  fail "Imagem inválida (Esperado: (!))." unless @pages.check_status_not_paid
end
