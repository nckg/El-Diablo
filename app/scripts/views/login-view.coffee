class ElDiablo.loginView extends Backbone.View
  el: $( "#heroes" )
  
  initialize: () ->
    
  render: () ->
    $.get '/scripts/templates/login.mustache', ( data ) =>
      $( @el ).html Mustache.render( data )