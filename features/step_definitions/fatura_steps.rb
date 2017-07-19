Quando(/^altero o status de pagamento da minha fatura anterior no firebase para Pago$/) do
  @pages = page(FaturaScreen).await(timeout: 5)
  @pages.invoice_true

end

Então(/^meu status de pagamento é mostrado para pago$/) do
  fail "Ícone não exibido na tela." unless @pages.check_image_status_visible
  fail "Imagem inválida (Esperado: (V))." unless @pages.check_status_paid
end

Quando(/^fecho a fatura do mês anterior$/) do
  @pages.invoice_false
end

Então(/^meu status de pagamento é mostrado como em aberto$/) do
  fail "Ícone não exibido na tela." unless @pages.check_image_status_visible
  fail "Imagem inválida (Esperado: (!))." unless @pages.check_status_not_paid
end
