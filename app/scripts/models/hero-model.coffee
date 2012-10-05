class ElDiablo.HeroModel extends Backbone.Model
   defaults :
      battleNetId    : ''
      id             : ''
      activeSkills   : ''
      passiveSkills   : ''
      
   url : ->
      "#{ElDiablo.Config.urlFormat}profile/#{@attributes.battleNetId}/hero/#{@id}"

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