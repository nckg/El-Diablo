
  window.templates = [];

  templates.hero_overview = '<div class="row-fluid" id="hero-overview">\n  {{#heroes}}\n  <div class="span3 hero {{class}}">\n    <a href="#{{id}}" data-id="{{id}}">\n      <h4>{{name}}</h4>\n      <span class="{{class}} level">{{level}}</span>\n      <p class="classname">{{class}}{{{getParagonLevel}}}</p>\n    </a>\n  </div>\n		{{/heroes}}\n</div>';

  templates.hero_detail = '<div id="hero-detail" class="{{class}}">\n  <div class="container-fluid" id="name">\n    <div class="row-fluid">\n      <h1>{{name}} <small>level <strong>{{level}}</strong>{{{getParagonLevel}}} {{class}}</small></h1>\n    </div>\n  </div>\n  {{#stats}}\n  <div class="container-fluid">\n    <div class="row-fluid" id="stats">\n      <div class="span2">\n        <h2>Offense</h2>\n      </div>\n      <div class="span2">\n        <h2>Defense</h2>\n      </div>\n      <div class="span2">\n        <h2>Life</h2>\n      </div>\n      <div class="span2">\n        <h2>Resource</h2>\n      </div>\n      <div class="span2">\n        <h2>Adventure</h2>\n      </div>\n    </div>\n    {{/stats}}\n  \n    <div class="row-fluid">\n      <h2>Items</h2>\n      <div id="items">\n        <div id="hero-body" class="span3">\n          <img src="img/body.png" />\n          <ul id="gems">\n            {{#items}}\n            <li id="{{getApiId}}-gems" class="{{identifier}}"></li>\n            {{/items}}\n          </ul>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n</div>';

  templates.item_detail = '<h4>{{name}}</h4>\n<ul class="attr">\n{{#attributes}}\n  <li>{{.}}</li>\n{{/attributes}}\n{{^attributes}}\n  <li>No attributes</li>\n{{/attributes}}\n</ul>\n<ul class="gems">\n{{#gems}}\n  <li class="gem {{displayColor}}">{{attributes}}<br /><small>{{name}}</small></li>\n{{/gems}}';

  templates.gems = '{{#gems}}\n    <span class="gem {{id}}">{{icon}}</span>\n{{/gems}}';
