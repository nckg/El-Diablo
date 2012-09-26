class ElDiablo.Router extends Backbone.Router
  routes =
    "*actions": "defaultRoute"
  
  defaultRoute: ( actions ) ->
    console.log actions