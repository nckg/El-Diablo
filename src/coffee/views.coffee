class window.Diablo3
  constructor: ( @region="eu" ) ->
    @protocol = "http://"
    @server = "battle.net/"
    @urlFormat = "#{@protocol}#{@region}.#{@server}api/d3/"
  
  getInfo: ( battleTag, callback ) ->
    $.ajax
      url: "#{@urlFormat}profile/#{battleTag}/"
      dataType: "jsonp"
      type: "get"
      success: ( data ) =>
        #console.log data
        callback( data )
      error: () ->
        console.log "Could not request the hero data"
  
  getHero: ( battleTag, heroId, callback ) ->
    $.ajax
      url: "#{@urlFormat}profile/#{battleTag}/hero/#{heroId}"
      dataType: "jsonp"
      type: "get"
      success: ( data ) =>
        #console.log data
        callback( data )
      error: () ->
        console.log "Could not request the hero data"
  
  getItem: ( itemId, callback ) ->
    itemId = itemId.replace "item/", ""
    
    $.ajax
      url: "#{@urlFormat}data/item/#{itemId}"
      dataType: "jsonp"
      type: "get"
      success: ( data ) =>
        #console.log data
        if callback?
          callback( data )
      error: () ->
        console.log "Could not request the item data"        
    
class window.Overview
  constructor:  (data) ->
    @artisans             = data.artisans
    @battleTag            = data.battleTag
    @fallenHeroes         = data.fallenHeroes
    @hardcoreArtisans     = data.hardcoreArtisans
    @hardcoreProgression  = data.hardcoreProgression
    @heroes               = []
    @kills                = data.kills
    @lastHeroPlayed       = data.lastHeroPlayed
    @lastUpdated          = data.lastUpdated
    @progression          = data.progression
    @timePlayed           = data.timePlayed
    
    for hero in data.heroes
      @heroes.push new Hero( hero )
      
    console.log(@heroes)
    
class window.Hero
  constructor:  ( data, @callback=null ) ->
    @class        = data.class
    @dead         = data.dead
    @followers    = data.followers
    @gender       = data.gender
    @hardcore     = data.hardcore
    @id           = data.id
    @kills        = data.kills
    @last_updated = data["last-updated"]
    @level        = data.level
    @paragonLevel = data.paragonLevel
    @name         = data.name
    @progress     = data.progress
    @stats        = data.stats
    @items        = []
    @activeSkills = []
    @passiveSkills = []
    
    console.log data
    
    for key, item of data.items
      @items.push new Item( key, item )
    
    if data.skills isnt undefined
      for skill in data.skills.active
        @activeSkills.push new Skill( skill ) if skill.skill isnt undefined
  
      for skill in data.skills.passive
        @passiveSkills.push new Skill( skill ) if skill.skill isnt undefined
  
  toPercent: () ->
    ( value, render ) ->
      "#{parseInt( value * 100 )}%"
  
  paragonBadge: () ->
   "<span class=\"badge badge-info paragon-level\">#{@paragonLevel}</span>" if @paragonLevel > 0
  
class window.Item
  constructor: ( @identifier, data ) ->
    @displayColor   = data.displayColor
    @gems           = []
    @icon           = data.icon
    @id             = data.id
    @name           = data.name
    @requiredLevel  = data.requiredLevel
    @tooltipParams  = data.tooltipParams
    @type           = data.type
    @typeName       = data.typeName
    @attributes     = []
    @attributesRaw  = []
    @bonusAffixes   = null
    @itemLevel      = null
    @salvage        = null
    @socketEffects  = null
    
  getApiId: () ->
    @tooltipParams.replace "item/", ""
  
  getFullDetail: ( callback=null ) ->
    d3 = new Diablo3()
    d3.getItem @getApiId(), ( data ) =>
      @attributes.push attr for attr in data.attributes
      @attributesRaw  = data.attributesRaw
      @bonusAffixes   = data.bonusAffixes
      @itemLevel      = data.itemLevel
      @salvage        = data.salvage
      @socketEffects  = data.socketEffects

      if data.gems?
        for gem in data.gems
          @gems.push new Gem( gem )
      
      callback( @ ) if callback?

class window.Gem
  constructor: ( data ) ->
    @attributes = data.attributes
    @attributesRaw = data.attributesRaw
    @displayColor = data.item.displayColor
    @icon = data.item.icon
    @id = data.item.id
    @name = data.item.name
    @tooltipParams = data.item.tooltipParams
    
class window.Skill
  constructor: ( data ) ->
    @categorySlug       = data.skill.categorySlug
    @description        = data.skill.description
    @icon               = data.skill.icon
    @level              = data.skill.level
    @name               = data.skill.name
    @simpleDescription  = data.skill.simpleDescription
    @skillCalcId        = data.skill.skillCalcId
    @slug               = data.skill.slug
    @tooltipUrl         = data.skill.tooltipUrl
    
    if data.rune?
      @rune = new Rune( data.rune )
  
  htmlDescription: () ->
    @description.replace( /\n/g, '<br />' )
  
class window.Rune
  constructor: ( data ) ->
    @description        = data.description
    @level              = data.level
    @name               = data.name
    @order              = data.order
    @simpleDescription  = data.simpleDescription
    @skillCalcId        = data.skillCalcId
    @slug               = data.slug
    @tooltipParams      = data.tooltipParams
    @type               = data.type
    
       