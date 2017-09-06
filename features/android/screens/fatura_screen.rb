class FaturaScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{image_status}'" }

  # Declare all the elements of this screen
  element(:image_status)         { 'image_payment_status' }

  # Declare all actions of this screen
  def invoice_true
    system("curl -X PATCH -d '{\"paid\":true, \"value\": 12.21}' 'https://kantina-3606f.firebaseio.com/desenvolvimento/usuarios/Luccas Xavier/invoices/previous.json?auth=XQch1IAHNxauN9hxVx3Zq6vdmF0yuzRxYum009sn'")
    sleep(4)
  end

  def invoice_false
    system("curl -X PATCH -d '{\"paid\":false, \"value\": 12.21}'  'https://kantina-3606f.firebaseio.com/desenvolvimento/usuarios/Luccas Xavier/invoices/previous.json?auth=XQch1IAHNxauN9hxVx3Zq6vdmF0yuzRxYum009sn'")
    sleep(4)
  end

  def check_image_status_visible
    visible?(image_status)
  end

  def check_status_not_paid
    temp = query("* id:'image_payment_status'", :contentDescription)
    temp[0] == "Invoice not paid image"
  end

  def check_status_paid
    temp = query("* id:'image_payment_status'", :contentDescription)
    temp[0] == "Invoice paid image"
  end
end
