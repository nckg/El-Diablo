class ElDiablo.ItemModel extends Backbone.Model
    defaults :
        id: null
        
    url: () ->
        "#{ElDiablo.Config.urlFormat}data/item/#{@id}"

    sync: ( method, model, options ) ->
        params = _.extend
            type: 'GET'
            dataType: 'jsonp'
            url: model.url()
            processData: false
        , options

        $.ajax( params )

    parse: ( response ) ->
        response
    
