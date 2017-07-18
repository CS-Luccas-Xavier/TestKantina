class LoginusuarioScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{btn_login}'" }

  # Declare all the elements of this screen
  element(:btn_login)               { 'button_google_sign_in' }
  element(:btn_choose_user)         { 'account_display_name' }
  element(:btn_choose_new_user)         { 'button2' }

  def touch_btn_login
    touch_screen_element(btn_login)
  end

  def touch_valid_email
    sleep(1)
    system('adb shell input tap 564 840')
    sleep(5)
  end

  def touch_invalid_email
    sleep(1)
    system('adb shell input tap 536 1034')
    sleep(5)
  end

  def check_msg_invalid_user
    temp = query("*")
    temp.include?("Please sign in using a Concrete account.")
  end

end
