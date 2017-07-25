class FiltrolistaScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{btn_search}'" }

  # Declare all the elements of this screen
  element(:btn_search)                 { 'widget_search_view' }
  element(:tb_filter)                  { 'peding' }
  element(:tv_product)                 { 'text_view_product_name' }
  element(:btn_x_clean)                { 'peding' }
  element(:btn_goback_home)            { 'peding' }

  # Declare all actions of this screen
  def touch_btn_search
    touch_screen_element(btn_search)
  end

  def check_visible_return_btn
      visible?(btn_goback_home)
  end

  def filter_not_exists
    enter("PRODUTOINEXISTENTE", tb_filter)
  end

  def check_msg_not_exists
    temp = query("*", :text)
    temp.include?("No results found")
  end

  def filter_words_accentuation
    enter("ITUBAINA", tb_filter)
  end

  def filter_upcase_downcase
    enter("ItuBAínA", tb_filter)
  end

  def check_filter
    temp = query("* id:'text_view_product_name'", :text)
    if temp.count > 1
      return false
    else
      temp[0] == "ITUBAÍNA"
    end
  end

  def enter_text_value
    enter("BISCOITO", tb_filter)
  end

  def touch_clean_btn
    touch_screen_element(btn_x_clean)
  end

  def check_qt_products
    qt = query("* id:'text_view_product_name'", :text).count
    temp = `curl -s 'https://kantina-3606f.firebaseio.com/produtos.json' | grep -o \"productCategory\" | wc -l`
    qt == temp
  end

end
