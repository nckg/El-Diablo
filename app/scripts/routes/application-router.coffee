class ElDiablo.Router extends Backbone.Router
  routes :
    ""          : "index"
    "id/:name-:number"  : "overview"
  
  initialize: ( options ) ->
  
  index: ( hash ) ->
    tutorial = new ElDiablo.applicationView()
  
  overview: ( name, number ) ->
    new ElDiablo.overviewView()