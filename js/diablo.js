(function() {
  var getInfo, submitForm;
  var _this = this;

  submitForm = function(event) {
    var $input, $login, battleNetId, region;
    event.preventDefault();
    $login = $('#login-row');
    $input = $('#battlenetid');
    region = $('#region option:selected').val();
    battleNetId = $input.val();
    return getInfo(battleNetId, region, function() {
      return $input.parents("div.control-group").addClass("error");
    }, function() {
      $input.parents("div.control-group").removeClass("error");
      return $login.hide();
    });
  };

  getInfo = function(battleNetId, region, onError, onSuccess) {
    var d3, info, pattern;
    if (region == null) region = "eu";
    if (onError == null) onError = null;
    if (onSuccess == null) onSuccess = null;
    pattern = /^(\w+)(#|-){1}(\d+)$/;
    if (battleNetId.search(pattern) === -1) {
      if (onError != null) onError();
      return false;
    } else {
      if (onSuccess != null) onSuccess();
    }
    battleNetId = battleNetId.replace(pattern, "$1-$3");
    d3 = new Diablo3(region);
    info = d3.getInfo(battleNetId, function(data) {
      var overview;
      overview = new Overview(data);
      return $('#heroes').html(Mustache.render(templates.hero_overview, overview));
    });
    return $('#heroes a').live('click', function(event) {
      event.preventDefault();
      return d3.getHero(battleNetId, $(this).attr("data-id"), function(data) {
        var hero, index, item, _ref, _results;
        hero = new Hero(data);
        $('#hero').html(Mustache.render(templates.hero_detail, hero));
        _ref = hero.items;
        _results = [];
        for (index in _ref) {
          item = _ref[index];
          _results.push(item.getFullDetail(function(result) {
            $('#' + result.getApiId()).html(Mustache.render(templates.item_detail, result));
          }));
        }
        return _results;
      });
    });
  };

  $("document").ready(function() {
    var $form, hash, hashes;
    var _this = this;
    $form = $("#searchform");
    $form.bind("submit", submitForm);
    if (window.location.hash) {
      hash = window.location.hash.substring(1);
      if (hash) {
        hashes = hash.split('_');
        return getInfo(hashes[0], hashes[1], function() {
          alert("Invalid Battle.Net ID");
          return false;
        }, function() {
          var $login;
          $login = $('#login-row');
          return $login.hide();
        });
      }
    }
  });

}).call(this);
