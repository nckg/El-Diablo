class ElDiablo.heroView extends Backbone.View
	el: $( "#hero" )

	initialize: ( @heroId ) ->
		$( "#login-row" ).hide()

		@heroColl = new ElDiablo.HeroCollection( @heroId )
		@heroColl.bind "reset", @render, @
		@heroColl.fetch()

	render: () ->
		$.get '/scripts/templates/hero.mustache', ( data ) =>
	    	$( @el ).html Mustache.render( data, @heroColl.models[0].attributes )
