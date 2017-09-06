class VisualizarvalorfechadogastoScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{tv_closed_value}'" }

  # Declare all the elements of this screen
  element(:tv_closed_value)         { 'text_view_last_invoice' }

  def check_closed_value_visible
    visible?(tv_closed_value)
  end

  def check_zero_closed_value
    closed_value = query("* id:'text_view_last_invoice'", :text)
    closed_value[0] == "0,00"
  end
end
