  window.Diablo3 = (function() {

    function Diablo3(region) {
      this.region = region != null ? region : "eu";
      this.protocol = "http://";
      this.server = "battle.net/";
      this.urlFormat = "" + this.protocol + this.region + "." + this.server + "api/d3/";
    }

    Diablo3.prototype.getInfo = function(battleTag, callback) {
      var _this = this;
      return $.ajax({
        url: "" + this.urlFormat + "profile/" + battleTag + "/",
        dataType: "jsonp",
        type: "get",
        success: function(data) {
          return callback(data);
        },
        error: function() {
          return console.log("Could not request the hero data");
        }
      });
    };

    Diablo3.prototype.getHero = function(battleTag, heroId, callback) {
      var _this = this;
      return $.ajax({
        url: "" + this.urlFormat + "profile/" + battleTag + "/hero/" + heroId,
        dataType: "jsonp",
        type: "get",
        success: function(data) {
          return callback(data);
        },
        error: function() {
          return console.log("Could not request the hero data");
        }
      });
    };

    Diablo3.prototype.getItem = function(itemId, callback) {
      var _this = this;
      itemId = itemId.replace("item/", "");
      return $.ajax({
        url: "" + this.urlFormat + "data/item/" + itemId,
        dataType: "jsonp",
        type: "get",
        success: function(data) {
          if (callback != null) return callback(data);
        },
        error: function() {
          return console.log("Could not request the item data");
        }
      });
    };

    return Diablo3;

  })();

  window.Overview = (function() {

    function Overview(data) {
      var hero, _i, _len, _ref;
      this.artisans = data.artisans;
      this.battleTag = data.battleTag;
      this.fallenHeroes = data.fallenHeroes;
      this.hardcoreArtisans = data.hardcoreArtisans;
      this.hardcoreProgression = data.hardcoreProgression;
      this.heroes = [];
      this.kills = data.kills;
      this.lastHeroPlayed = data.lastHeroPlayed;
      this.lastUpdated = data.lastUpdated;
      this.progression = data.progression;
      this.timePlayed = data.timePlayed;
      _ref = data.heroes;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        hero = _ref[_i];
        this.heroes.push(new Hero(hero));
      }
    }

    return Overview;

  })();

  window.Hero = (function() {

    function Hero(data, callback) {
      var item, key, skill, _i, _j, _len, _len2, _ref, _ref2, _ref3;
      this.callback = callback != null ? callback : null;
      this["class"] = data["class"];
      this.dead = data.dead;
      this.followers = data.followers;
      this.gender = data.gender;
      this.hardcore = data.hardcore;
      this.id = data.id;
      this.kills = data.kills;
      this.last_updated = data["last-updated"];
      this.level = data.level;
      this.paragonLevel = data.paragonLevel;
      this.name = data.name;
      this.progress = data.progress;
      this.stats = data.stats;
      this.items = [];
      this.activeSkills = [];
      this.passiveSkills = [];
      _ref = data.items;
      for (key in _ref) {
        item = _ref[key];
        this.items.push(new Item(key, item));
      }
      if (data.skills !== void 0) {
        _ref2 = data.skills.active;
        for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
          skill = _ref2[_i];
          if (skill.skill !== void 0) this.activeSkills.push(new Skill(skill));
        }
        _ref3 = data.skills.passive;
        for (_j = 0, _len2 = _ref3.length; _j < _len2; _j++) {
          skill = _ref3[_j];
          if (skill.skill !== void 0) this.passiveSkills.push(new Skill(skill));
        }
      }
    }

    Hero.prototype.toPercent = function() {
      return function(value, render) {
        return "" + (parseInt(value * 100)) + "%";
      };
    };

    Hero.prototype.paragonBadge = function() {
      if (this.paragonLevel > 0) {
        return "<span class=\"badge badge-info paragon-level\">" + this.paragonLevel + "</span>";
      }
    };

    Hero.prototype.getParagonLevel = function() {
      if (this.paragonLevel > 0) {
        return " - paragon: <strong>" + this.paragonLevel + "</strong>";
      }
    };

    return Hero;

  })();

  window.Item = (function() {

    function Item(identifier, data) {
      this.identifier = identifier;
      this.displayColor = data.displayColor;
      this.gems = [];
      this.icon = data.icon;
      this.id = data.id;
      this.name = data.name;
      this.requiredLevel = data.requiredLevel;
      this.tooltipParams = data.tooltipParams;
      this.type = data.type;
      this.typeName = data.typeName;
      this.attributes = [];
      this.attributesRaw = [];
      this.bonusAffixes = null;
      this.itemLevel = null;
      this.salvage = null;
      this.socketEffects = null;
    }

    Item.prototype.getApiId = function() {
      return this.tooltipParams.replace("item/", "");
    };

    Item.prototype.getFullDetail = function(callback) {
      var d3;
      var _this = this;
      if (callback == null) callback = null;
      d3 = new Diablo3();
      return d3.getItem(this.getApiId(), function(data) {
        var attr, gem, _i, _j, _len, _len2, _ref, _ref2;
        _ref = data.attributes;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          attr = _ref[_i];
          _this.attributes.push(attr);
        }
        _this.attributesRaw = data.attributesRaw;
        _this.bonusAffixes = data.bonusAffixes;
        _this.itemLevel = data.itemLevel;
        _this.salvage = data.salvage;
        _this.socketEffects = data.socketEffects;
        if (data.gems != null) {
          _ref2 = data.gems;
          for (_j = 0, _len2 = _ref2.length; _j < _len2; _j++) {
            gem = _ref2[_j];
            _this.gems.push(new Gem(gem));
          }
        }
        if (callback != null) return callback(_this);
      });
    };

    return Item;

  })();

  window.Gem = (function() {

    function Gem(data) {
      this.attributes = data.attributes;
      this.attributesRaw = data.attributesRaw;
      this.displayColor = data.item.displayColor;
      this.icon = data.item.icon;
      this.id = data.item.id;
      this.name = data.item.name;
      this.tooltipParams = data.item.tooltipParams;
    }

    return Gem;

  })();

  window.Skill = (function() {

    function Skill(data) {
      this.categorySlug = data.skill.categorySlug;
      this.description = data.skill.description;
      this.icon = data.skill.icon;
      this.level = data.skill.level;
      this.name = data.skill.name;
      this.simpleDescription = data.skill.simpleDescription;
      this.skillCalcId = data.skill.skillCalcId;
      this.slug = data.skill.slug;
      this.tooltipUrl = data.skill.tooltipUrl;
      if (data.rune != null) this.rune = new Rune(data.rune);
    }

    Skill.prototype.htmlDescription = function() {
      return this.description.replace(/\n/g, '<br />');
    };

    return Skill;

  })();

  window.Rune = (function() {

    function Rune(data) {
      this.description = data.description;
      this.level = data.level;
      this.name = data.name;
      this.order = data.order;
      this.simpleDescription = data.simpleDescription;
      this.skillCalcId = data.skillCalcId;
      this.slug = data.slug;
      this.tooltipParams = data.tooltipParams;
      this.type = data.type;
    }

    return Rune;

  })();
