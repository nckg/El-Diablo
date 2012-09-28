window.ElDiablo = 
  Models      : {}
  Collections : {}
  Views       : {}
  Routers     : {}
  Config      : {}

  init        : () ->
    ElDiablo.Config.region    = 'eu'
    ElDiablo.Config.protocol  = "http://";
    ElDiablo.Config.server    = "battle.net/";
    ElDiablo.Config.urlFormat = "#{ElDiablo.Config.protocol}#{ElDiablo.Config.region}.#{ElDiablo.Config.server}api/d3/";
    
    ElDiablo.Routers.Router = new ElDiablo.Router()
    Backbone.history.start()
    
$ ->
  ElDiablo.init();