class RealizarlogoutScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{btn_logout}'" }

  # Declare all the elements of this screen
  element(:btn_logout)         { 'title' }
  #element(:btn_logout)         { 'item_logout' }
  #element(:btn_menu)           { 'menu_home' }

  # Declare all actions of this screen
  def touch_btn_menu
    touch_screen_element(btn_menu)
  end

  def touch_btn_logout
    touch_screen_element(btn_logout)
  end

end
