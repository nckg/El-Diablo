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
      displayColor: "",
      gems: [],
      icon: "",
      id: "",
      name: "",
      requiredLevel: 0,
      tooltipParams: "",
      type: "",
      typeName: "",
      attributes: [],
      attributesRaw: [],
      bonusAffixes: null,
      itemLevel: null,
      salvage: null,
      socketEffects: null
    };

    HeroModel.prototype.initialize = function() {};

    return HeroModel;

  })(Backbone.Model);

}).call(this);
