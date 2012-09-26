(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ElDiablo.HeroCollection = (function(_super) {

    __extends(HeroCollection, _super);

    function HeroCollection() {
      return HeroCollection.__super__.constructor.apply(this, arguments);
    }

    HeroCollection.prototype.model = ElDiablo.Hero;

    return HeroCollection;

  })(Backbone.Collection);

}).call(this);
