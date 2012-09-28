class ElDiablo.overviewView extends Backbone.View
  el        : $( "heroes" )
  template  : ''
  
  initialize: () ->
    $( "#login-row" ).hide()
    
    @heroColl = new ElDiablo.OverviewCollection()
    @heroColl.bind "reset", @render, @
    @heroColl.fetch()
    
  render: () ->
    