# Submit our form
#
# event - jQuery event object
#
# Does that
submitForm = ( event ) =>
  event.preventDefault()
  
  $login = $( '#login-row' )
  $input = $( '#battlenetid' )
  
  region = $( '#region option:selected' ).val()
  battleNetId = $input.val()
  
  getInfo battleNetId, region, () =>
    $input.parents( "div.control-group" ).addClass "error"
  , () =>
    $input.parents( "div.control-group" ).removeClass "error"
    $login.hide()

# Fetches our hero information
#
# battleNetId - your battle.net id
# region      - the region you're playing in
# onError     - callback on error
# onSuccess   - callback on successs
#
# Returns nothing
getInfo = ( battleNetId, region="eu", onError=null, onSuccess=null ) =>
  pattern = /^(\w+)(#|-){1}(\d+)$/
  
  if battleNetId.search( pattern ) is -1
    onError() if onError?
    return false
  else 
    onSuccess() if onSuccess?
  
  battleNetId = battleNetId.replace pattern, "$1-$3"
  
  d3 = new Diablo3( region )
  info = d3.getInfo battleNetId, ( data ) ->
    overview = new Overview( data )
    $( '#heroes' ).html( Mustache.render(templates.hero_overview, overview) )
  
  $( '#heroes a' ).live 'click', ( event ) ->
    event.preventDefault()
    
    d3.getHero battleNetId, $( this ).attr( "data-id" ), ( data ) ->
      hero = new Hero( data )
      $( '#hero' ).html( Mustache.render( templates.hero_detail, hero ) )
          
      for index, item of hero.items
        item.getFullDetail ( result ) ->
          $( '#' + result.getApiId() ).html( Mustache.render( templates.item_detail, result ) )
          return

$( "document" ).ready () ->
  $form = $( "#searchform" );
  $form.bind "submit", submitForm
  
  if window.location.hash
    hash = window.location.hash.substring( 1 ); # Puts hash in variable, and removes the # character
    
    if hash
      hashes = hash.split( '_' )

      getInfo hashes[0], hashes[1], () =>
        alert( "Invalid Battle.Net ID" )
        return false
      , () =>
        $login = $( '#login-row' )
        $login.hide()
    