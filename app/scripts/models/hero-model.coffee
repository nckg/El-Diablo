class ElDiablo.HeroModel extends Backbone.Model
   defaults :
      battleNetId    : ''
      id             : ''
      
   url : ->
      console.log @
      "#{ElDiablo.Config.urlFormat}profile/#{@attributes.battleNetId}/hero/#{@id}"

   sync: ( method, model, options ) ->
      params = _.extend
            type: 'GET'
            dataType: 'jsonp'
            url: model.url()
            processData: false
         , options

      $.ajax( params )