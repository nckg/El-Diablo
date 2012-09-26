(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ElDiablo.SkillModel = (function(_super) {
    var defaults;

    __extends(SkillModel, _super);

    function SkillModel() {
      return SkillModel.__super__.constructor.apply(this, arguments);
    }

    defaults = {
      name: "",
      value: ""
    };

    return SkillModel;

  })(Backbone.Model);

}).call(this);
