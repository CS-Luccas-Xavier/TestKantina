class EstatisticasScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{pie_chart}'" }

  # Declare all the elements of this screen
  element(:pie_chart)         { 'pie_chart' }
  # element(:button)              { pending 'Insert button identificator' }

  # Declare all actions of this screen
end
