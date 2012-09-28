class ElDiablo.OverviewCollection extends Backbone.Collection
  url: () ->
    "#{ElDiablo.Config.urlFormat}profile/FaceRip-2904/"
  model: ElDiablo.Overview

  sync: ( method, model, options ) ->
    options.dataType = 'jsonp'
    Backbone.sync( method, model, options )

  parse: ( response ) ->
    console.log jQuery.parseJSON "[#{JSON.stringify( response )}]"
    jQuery.parseJSON "[#{JSON.stringify( response )}]"