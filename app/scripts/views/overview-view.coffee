class ElDiablo.overviewView extends Backbone.View
	el: $( "#heroes" )

	events: 
		"click #hero-overview .hero a": "getDetail"

	initialize: ( @name, @value ) ->
		$( "#login-row" ).hide()

		@heroColl = new ElDiablo.HeroCollection( @name, @value )
		@heroColl.bind "reset", @render, @
		@heroColl.fetch()

	render: () ->
		$.get '/scripts/templates/overview.mustache', ( data ) =>
			$( @el ).html Mustache.render( data, @heroColl.models[0].attributes )

	getDetail: ( event ) ->
		heroId = $( event.currentTarget ).attr( "data-id" )
		Backbone.history.navigate( "/id/#{@name}-#{@value}/hero/#{heroId}", true )

		false