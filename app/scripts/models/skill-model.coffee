class ElDiablo.HeroModel extends Backbone.Model
	defaults =
    categorySlug      : ""
    description       : ""
    icon              : ""
    level             : 0
    name              : ""
    simpleDescription : ""
    skillCalcId       : ""
    slug              : ""
    tooltipUrl        : ""
    rune              : null
    
  initialize: () ->
    