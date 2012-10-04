class ElDiablo.heroView extends Backbone.View
	el: $( "#hero" )

	initialize: ( battleNetName, battleNetNumber, heroId ) ->
		$( "#login-row" ).hide()

		@hero = new ElDiablo.HeroModel( { battleNetId: "#{battleNetName}-#{battleNetNumber}", id: heroId } )
		@hero.bind "reset", @render, @
		@hero.fetch()

	render: () ->
		$.get '/scripts/templates/hero.mustache', ( data ) =>
	    	$( @el ).html Mustache.render( data, @heroColl.models[0].attributes )
