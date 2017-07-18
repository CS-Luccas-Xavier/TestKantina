class VisualizarvalorfechadogastoScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{tv_actual_value}'" }

  # Declare all the elements of this screen
  element(:tv_closed_value)         { 'pending' }

  def check_closed_value_visible
    visible?(tv_closed_value)
  end

  def check_content_closed_value
    tv_closed_value != ""
  end
end
