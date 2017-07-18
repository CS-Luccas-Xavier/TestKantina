class SelecinaritemScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{tVproductName}'" }

  # Declare all the elements of this screen
  element(:tVproductName)         { 'text_view_product_name' }
  element(:tVproductPrice)        { 'text_view_product_price' }
  element(:tVproductType)         { 'image_view_product_icon' }
  element(:btnConfirBuy)          { 'button1' }
  element(:btnCancelBuy)          { 'button2' }

  def touch_product
    touch_element_by_index(tVproductName, 0)
  end

  def touch_btn_confirm_buy
    touch_screen_element(btnConfirBuy)
  end

  def touch_btn_cancel_buy
    touch_screen_element(btnCancelBuy)
  end

  def check_msg_sucess_buy
    sleep(1)
    msg = query "*", :text
    msg.include?("You just bought a product from Kantina!")
  end
end
