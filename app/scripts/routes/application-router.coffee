class ElDiablo.Router extends Backbone.Router
    routes :
        ""                          : "index"
        "id/:name-:number"          : "overview"
        "id/:name-:number/hero/:id" : "heroDetail"

    initialize: ( options ) ->

    index: ( hash ) ->
        tutorial = new ElDiablo.applicationView()

    overview: ( name, number ) ->
        new ElDiablo.overviewView( name, number )

    heroDetail: ( id ) ->
        new ElDiablo.heroView( id )