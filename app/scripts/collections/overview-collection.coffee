class ElDiablo.OverviewCollection extends Backbone.Collection
  url: () ->
    "#{ElDiablo.Config.urlFormat}profile/FaceRip-2904/"
  model: ElDiablo.OverviewModel

  sync: ( method, model, options ) ->
    params = _.extend
      type: 'GET'
      dataType: 'jsonp'
      url: model.url()
      processData: false
    , options
    
    $.ajax params

  parse: ( response ) ->
    response