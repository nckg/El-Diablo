class ElDiablo.HeroModel extends Backbone.Model
	defaults =
   	dead          : 0
   	followers     : []
   	gender        : 0
   	hardcore      : 0
   	kills         : 0
   	lastUpdated   : 0
   	level         : 0
   	paragonLevel  : 0
   	stats         : []
   	items         : []
   	activeSkils   : []
   	passiveSkils  : []
   	
  initialize: () ->
    