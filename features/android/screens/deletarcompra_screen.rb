class DeletarcompraScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{actual_value}'" }

  # Declare all the elements of this screen
  element(:btn_delete)          { 'button1' }
  element(:btn_cancel_delete)   { 'button2' }
  element(:actual_value)        { 'text_view_price_last_purchase' }
  element(:tv_first_product)    { 'text_view_product_name' }

  # Declare all actions of this screen
  def long_touch_product_to_delete
    long_press("* id:'text_view_product_name' index:0")
  end

  def touch_confirm_delete
    touch_screen_element(btn_delete)
  end

  def touch_cancel_delete
    touch_screen_element(btn_cancel_delete)
  end

  def check_msg_successful
    sleep(3)
    msgs = query("*", :text)
    msgs.include?("Purchase deleted with success")
  end

  def check_msg_error_delete
    sleep(1)
    msgs = query("*", :text)
    msgs.include?("You can not delete a purchase after 24 hours from the date of purchase")
  end

  def check_same_actual_value
    new_value = query("* id:'text_view_price_last_purchase'", :text)
    @@old_actual_value == new_value[0]
  end

  def keep_list_products
    @@screen_name_products = query("* id:'text_view_product_name'", :text)
    @@screen_price_products = query("* id:'text_view_purchase_price'", :text)
    @@first_product = @@screen_name_products[0]
  end

  def check_qt_products
    temp = query("* id:'text_view_product_name'", :text).count
    temp == @@screen_name_products.count
  end

  def check_deleted_product
    temp = query("* id:'text_view_product_name'", :text)
    temp.include?(@@first_product) ? false : true
  end

  def check_new_actual_value
    actual_total_price = query("* id:'text_view_price_last_purchase'", :text)
    sum = @@old_actual_value.to_f - @@screen_price_products[0].to_f
    actual_total_price[0].to_f.round(2) == sum.to_f.round(2)
  end

  def long_touch_last_purchase
    qt = query("* id:'text_view_product_name'", :text).count - 1
    long_press("* id:'text_view_product_name' index:#{qt}")
  end

  def add_recently_purchase
    time = Time.now.to_i
    time = time * 1000
    system("curl -X PUT -d '{ \"buyDate\": #{time}, \"firebasePushID\": \"12213\", \"productCategory\": \"Bebida\", \"productName\": \"LUCCAS TESTE NOVO\", \"productPrice\": 12.32, \"userDisplayName\": \"Luccas Xavier\" }' 'https://kantina-3606f.firebaseio.com/desenvolvimento/usuarios/Luccas Xavier/compras/12213.json?auth=XQch1IAHNxauN9hxVx3Zq6vdmF0yuzRxYum009sn'")
    sleep(3)
  end

  def add_old_purchase
    system("curl -X PUT -d '{ \"buyDate\": 1501015508000, \"firebasePushID\": \"123456\", \"productCategory\": \"Comida\", \"productName\": \"LUCCAS TESTE OLD\", \"productPrice\": 1.00, \"userDisplayName\": \"Luccas Xavier\" }' 'https://kantina-3606f.firebaseio.com/desenvolvimento/usuarios/Luccas Xavier/compras/123456.json?auth=XQch1IAHNxauN9hxVx3Zq6vdmF0yuzRxYum009sn'")
    sleep(3)
  end
end
