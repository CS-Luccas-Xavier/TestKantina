class VisualizarvaloratualgastoScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{tv_closing_date}'" }

  # Declare all the elements of this screen
  element(:tv_actual_value)         { 'text_view_price_last_purchase' }
  element(:tv_closing_date)         { 'text_view_last_invoice' }
  element(:btn_purchase)            { 'purchase_fab' }

  def delete_all_buys
    #pending
  end

  def check_visible_actual_value
    visible?(tv_actual_value)
  end

  def check_content_actual_value
    tv_actual_value != 0
    #tv_actual_value == 0
  end

  def check_closing_date
    visible?(tv_closing_date)
  end

  def check_content_closing_date
    m = Date.today.month
    y = Date.today.year
    tv_closing_date.include?(Date.civil(y,m,-1).strftime("%d/%m/%Y"))
  end

  def touch_btn_purchase
     touch_screen_element(btn_purchase)
  end
end
