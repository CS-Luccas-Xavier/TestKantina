require 'calabash-android/abase'

class AndroidScreenBase < Calabash::ABase

  @@product_name
  @@product_price
  @@old_actual_value
  @@screen_name_products
  @@screen_price_products
  @@first_product

  def self.element(element_name, &block)
    define_method(element_name.to_s, *block)
  end

  class << self
    alias_method :value, :element
    alias_method :action, :element
    alias_method :trait, :element
  end

  def restart_app
    shutdown_test_server
    start_test_server_in_background
  end

  def method_missing(method, *args)
    if method.to_s.start_with?('touch_')
      # If method name starts with touch_, executes the touch
      # screen element method using the element name which is the
      # method name without the first 'touch_' chars
      touch_screen_element public_send(method.to_s.sub('touch_', ''))
    elsif method.to_s.start_with?('enter_')
      # If method starts with enter_, execute the enter method using
      # the field name, which is the method name without the initial
      # 'enter_' chars and appended '_field' chars
      enter args[0], public_send("#{method.to_s.sub('enter_', '')}_field")
    elsif method.to_s.end_with?('_visible?')
      # If method ends with _visible?, executes the visible? method
      # The field name is the method name without de ending
      # '_visible? chars
      visible? public_send(method.to_s.sub('_visible?', ''))
    elsif method.to_s.end_with?('_visible!')
      # Do the same as the method above, but throws an exception
      # if the field is not visible
      field_name = method.to_s.sub('_visible!', '')
                         .sub('_field', '')
                         .sub('_', ' ')
                         .capitalize
      raise ElementNotFoundError, "ID: #{field_name}" unless
        visible? public_send(method.to_s.sub('_visible!', ''))
    else
      super(method, args)
    end
  end

  def visible?(id, query = nil)
    query = "* id:'#{id}'" if query.nil?
    begin
      wait_for(timeout: 3) { element_exists query }
    rescue
      return false
    end
    true
  end

  element(:loading_screen)      { 'insert_loading_view_id' }

  # The progress bar of the application is a custom view
  def wait_for_progress
    sleep(2)
    wait_for_element_does_not_exist("* id:'#{loading_screen}'",
                                    timeout: 10)
  end

  def drag_to(direction)
    positions = [0, 0, 0, 0] # [ 'from_x', 'to_x', 'from_y', 'to_y' ]

    case(direction)
    when :baixo
      positions = [30,30,60,30]
    when :cima
      positions = [80,80,60,90]
    when :esquerda
      positions = [90,20,80,80]
    when :direita
      positions = [20,90,80,80]
    else
      raise 'Direction not known!'
    end

    # perform_action( 'action', 'from_x', 'to_x', 'from_y', 'to_y',
    # 'number of steps (in this case, velocity of drag' )
    perform_action('drag', positions[0], positions[1],
                   positions[2], positions[3], 15)
    sleep(1)
  end

  def drag_until_element_is_visible_with_special_query(direction, element)
    drag_until_element_is_visible direction, element,
                                  "* {text CONTAINS[c] '#{element}'}"
  end

  def drag_until_element_is_visible(direction, element, query = nil, limit = 15)
    i = 0

    element_query = ''
    if query.nil?
      element_query = "* marked:'#{element}'"
    else
      element_query = query
    end

    sleep(2)
    while !element_exists(element_query) && i < limit
      drag_to direction
      i += 1
    end

    fail "Executed #{limit} moviments #{direction} and "\
          "the element '#{element}' was not found on this view!" unless
      i < limit
  end

  def drag_for_specified_number_of_times(direction, times)
    times.times do
      drag_to direction
    end
  end

  # Negation indicates that we want a page that doesn't
  # has the message passed as parameter
  def is_on_page?(page_text, negation = '')
    fail 'Error! Invalid query string!' if
       page_text.to_s == ''
    begin
      is_on_page!(page_text, negation)
    rescue
      return false
    end
     true
  end

  # Negation indicates that we want a page that doesn't
  # has the message passed as parameter
  def is_on_page!(page_text, negation = '')
    fail 'Error! Invalid query string!' if
       page_text.to_s == ''

    should_not_have_exception = false
    should_have_exception = false
    begin
      wait_for(timeout: 5) { has_text? page_text }
      # If negation is not nil, we should raise an error
      # if this message was found on the view
      should_not_have_exception = true unless negation == ''
    rescue
      # only raise exception if negation is nil,
      # otherwise this is the expected behaviour
      should_have_exception = true if negation == ''
    end

    fail "Unexpected Page. The page should not have: '#{page_text}'" if
      should_not_have_exception

    fail "Unexpected Page. Expected was: '#{page_text}'" if
      should_have_exception
  end

  def enter(text, element, query = nil)
    if query.nil?
      query("* marked:'#{element}'", setText: text.to_s)
    else
      query(query, setText: text.to_s)
    end
  end

  def touch_screen_element(element, query = nil)
    query = "* id:'#{element}'" if query.nil?
    begin
      wait_for(timeout: 5) { element_exists(query) }
      touch(query)
    rescue => e
      raise "Problem in touch screen element: '#{element}'\nError Message: #{e.message}"
    end
  end

  def touch_element_by_index(id, index)
    wait_for(timeout: 5) { element_exists("* id:'#{id}' index:#{index}") }
    touch("* id:'#{id}' index:#{index}")
  end

  def clear_text_field(field)
    clear_text_in("android.widget.EditText id:'#{field}'}")
  end

  def select_date_on_date_picker(date, date_picker_field_id)
    # Touch the date picker field
    touch "* id:'#{date_picker_field_id}'"

    # Setting the date
    set_date 'DatePicker', date.year, date.month, date.day

    # Clicking in the Done button
    touch "* id:'button1'"
  end

  def set_product_name
    product_name = query("* id:'text_view_product_name'", :text)
    @@product_name = product_name[0]
  end

  def set_product_price
    product_price = query("* id:'text_view_product_price'", :text)
    @@product_price = product_price[0]
  end

  def set_old_value
    value = query("* id:'text_view_price_last_purchase'", :text)
    @@old_actual_value = value[0]
  end

  def turn_off_data
    system "adb shell svc data disable"
    # system('adb shell am start -a android.settings.AIRPLANE_MODE_SETTINGS >null')
    # sleep(1)
    # system('adb shell input tap 948 1235')
    # system('adb shell input keyevent KEYCODE_APP_SWITCH')
    # system('adb shell input keyevent 20')
    # system('adb shell input keyevent DEL')
    # system('adb shell input tap 400 400')
  end

  def check_internet
    sleep(4)
    temp = query("*", :text)
    temp.include?("There is no network connection")
  end

  def require_login
    element_exists("* id:'button_google_sign_in'")
  end

  def delete_all_buys
    system("curl -X DELETE \ 'https://kantina-3606f.firebaseio.com/desenvolvimento/usuarios/Luccas Xavier/compras.json?auth=XQch1IAHNxauN9hxVx3Zq6vdmF0yuzRxYum009sn'")
    sleep(4)
  end
end
