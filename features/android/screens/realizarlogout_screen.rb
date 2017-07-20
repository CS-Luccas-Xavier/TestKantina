class RealizarlogoutScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{tv_actual_value}'" }

  # Declare all the elements of this screen
  element(:tv_actual_value)         { 'text_view_price_last_purchase' }
  element(:btn_logout)         { 'title' }

  # Declare all actions of this screen
  def touch_btn_menu
    tap_when_element_exists("android.support.v7.widget.ActionMenuView index:0")
  end

  def touch_btn_logout
    touch_screen_element(btn_logout)
  end
end
