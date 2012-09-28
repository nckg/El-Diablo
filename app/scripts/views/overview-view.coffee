class ElDiablo.overviewView extends Backbone.View
  el: $( "#heroes" )
  
  initialize: () ->
    $( "#login-row" ).hide()
    
    @heroColl = new ElDiablo.OverviewCollection()
    @heroColl.bind "reset", @render, @
    @heroColl.fetch()
    
  render: () ->
    $.get '/scripts/templates/overview.mustache', ( data ) =>
      $( @el ).html Mustache.render( data, @heroColl.models[0].attributes )