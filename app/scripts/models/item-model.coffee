class ElDiablo.ItemModel extends Backbone.Model
  defaults :
    displayColor   : ""
    gems           : []
    icon           : ""
    id             : ""
    name           : ""
    requiredLevel  : 0
    tooltipParams  : ""
    type           : ""
    typeName       : ""
    attributes     : []
    attributesRaw  : []
    bonusAffixes   : null
    itemLevel      : null
    salvage        : null
    socketEffects  : null
    
  initialize: () ->
    
