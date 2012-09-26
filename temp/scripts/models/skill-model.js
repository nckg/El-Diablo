(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ElDiablo.HeroModel = (function(_super) {
    var defaults;

    __extends(HeroModel, _super);

    function HeroModel() {
      return HeroModel.__super__.constructor.apply(this, arguments);
    }

    defaults = {
      categorySlug: "",
      description: "",
      icon: "",
      level: 0,
      name: "",
      simpleDescription: "",
      skillCalcId: "",
      slug: "",
      tooltipUrl: "",
      rune: null
    };

    HeroModel.prototype.initialize = function() {};

    return HeroModel;

  })(Backbone.Model);

}).call(this);
