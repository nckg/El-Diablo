class ElDiablo.HeroModel extends Backbone.Model
  defaults =
    id            : ""
    name          : ""
    icon          : ""
    attrRaw       : ""
    attribute     : ""
    displayColor  : ""
    tooltipParams : ""
    
  initialize: () ->
    