class ElDiablo.HeroCollection extends Backbone.Collection
	model: ElDiablo.HeroModel

	initialize: ( @name, @value ) ->
		
	url: ( name, value )->
		"#{ElDiablo.Config.urlFormat}profile/#{@name}-#{@value}/"

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