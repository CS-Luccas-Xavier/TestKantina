class FaturaatualdetalhadaScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{tv_actual_value}'" }

  # Declare all the elements of this screen
  element(:tv_actual_value)         { 'text_view_price_last_purchase' }
  element(:tv_purchase_date)        { 'text_view_purchase_date' }

  # Declare all actions of this screen
  def check_new_product
    product_name = query("* id:'text_view_product_name'", :text)
    product_name[0] == @@product_name
  end

  def check_new_total_value
    product_price = query("* id:'text_view_price_last_purchase'", :text)
    @@product_price.to_f + @@old_actual_value.to_f == product_price[0].to_f
  end

  def check_order_by_date
    actualDates = query("* id:'text_view_purchase_date'", :text)
    dates = query("* id:'text_view_purchase_date'", :text)

    actualDates == dates
  end

  def check_zero_purchase
    temp = query("*", :text)
    temp.include?("You did not buy anything this month yet.")
  end
end
