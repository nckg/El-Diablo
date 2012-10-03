class ElDiablo.applicationView extends Backbone.View
	el: $( "#login-row" )

	initialize: ->
		@render()

	render: () ->
		$.get '/scripts/templates/login.mustache', ( data ) =>
	    	$( @el ).html Mustache.render( data )

	events: 
		"click button[type=submit]": "doLogin"

	doLogin: ( event ) ->
		pattern = /^(\w+)(#|-){1}(\d+)$/
		battleNetId = $( "#battlenetid" ).val()

		if battleNetId.search( pattern ) is -1
			alert( "Invalid Battle.Net ID" );
			return false

		name = battleNetId.replace pattern, "$1"
		number = battleNetId.replace pattern, "$3"

		Backbone.history.navigate( "/id/#{name}-#{number}", true )
		false
