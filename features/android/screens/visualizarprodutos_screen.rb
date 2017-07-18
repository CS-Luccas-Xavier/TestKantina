class VisualizarprodutosScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{tVproductName}'" }

  # Declare all the elements of this screen
  element(:tVproductName)         { 'text_view_product_name' }
  element(:tVproductPrice)        { 'text_view_product_price' }
  element(:tVproductType)         { 'image_view_product_icon' }

  # Declare all actions of this screen
  def check_products_page
    visible?(tVproductName)
  end

  def check_desc_prod
    temp = query("* id:'text_view_product_name'", :text)
    temp.include?("") ? false : true
  end

  def check_value_prod
    temp = query("* id:'text_view_product_price'", :text)
    temp.include?("") ? false : true
  end

  def check_qt_itens
    temp = query("* id:'text_view_product_price'", :text).count
    temp > 1
  end

  def check_orderby_name_screen
    namesAtual = query("* id:'text_view_product_name'", :text)
    namesEsperado = query("* id:'text_view_product_name'", :text)
    namesEsperado.sort!
    namesAtual == namesEsperado
  end

end
