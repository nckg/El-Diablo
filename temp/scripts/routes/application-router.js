(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ElDiablo.Router = (function(_super) {
    var routes;

    __extends(Router, _super);

    function Router() {
      return Router.__super__.constructor.apply(this, arguments);
    }

    routes = {
      "*actions": "defaultRoute"
    };

    Router.prototype.defaultRoute = function(actions) {
      return console.log(actions);
    };

    return Router;

  })(Backbone.Router);

}).call(this);
