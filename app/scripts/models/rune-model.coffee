class ElDiablo.HeroModel extends Backbone.Model
	defaults =
    description        : ""
    level              : 0
    name               : ""
    order              : 0
    simpleDescription  : ""
    skillCalcId        : ""
    slug               : ""
    tooltipParams      : ""
    type               : ""

  initialize: () ->
    