class ElDiablo.Router extends Backbone.Router
  routes :
    ""                  : "index"
    "id/:name-:number"  : "overview"
    "hero/:id"      : "heroDetail"
  
  initialize: ( options ) ->
  
  index: ( hash ) ->
    tutorial = new ElDiablo.applicationView()
  
  overview: ( name, number ) ->
    new ElDiablo.overviewView()
    
  heroDetail: ( id ) ->
    new ElDiablo.heroView()