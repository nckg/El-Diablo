
  window.templates = [];

  templates.hero_overview = '<div class="row-fluid" id="hero-overview">\n  {{#heroes}}\n  <div class="span2 hero">\n    <a href="#{{id}}" data-id="{{id}}">\n      <h4>{{name}}</h4>\n        <span class="{{class}}">{{level}}</span>\n        <p class="classname">{{class}}</p>\n    </a>\n  </div>\n		{{/heroes}}\n</div>';

  templates.hero_detail = '<div id="hero-detail" class="{{class}}">\n  <div class="row-fluid" id="name">\n    <h1>{{name}} <small>level <strong>{{level}}</strong> {{class}}</small></h1>\n  </div>\n  {{#stats}}\n  <div class="row-fluid" id="stats">\n    <div class="span4">\n      <h3>Core stats</h3>\n      <dl>\n        <dt class="demon-hunter monk">Dexterity</dt>\n        <dd class="demon-hunter monk">{{dexterity}}</dd> \n        <dt class="wizard witch-doctor">Intelligence</dt>\n        <dd class="wizard witch-doctor">{{intelligence}}</dd> \n        <dt class="barbarian">Strength</dt>\n        <dd class="barbarian">{{strength}}</dd> \n        <dt>Vitality</dt>\n        <dd>{{vitality}}</dd> \n        <dt>Armor</dt>\n        <dd>{{armor}}</dd> \n        <dt>Life</dt>\n        <dd>{{life}}</dd> \n        <dt>Damage</dt>\n        <dd>{{damage}}</dd>\n      </dl>\n    </div>\n    <div class="span4">\n      <h3>Resists</h3>\n      <dl>\n        <dt>Arcane</dt><dd>{{arcaneResist}}</dd> \n        <dt>Cold</dt><dd>{{coldResist}}</dd> \n        <dt>Fire</dt><dd>{{fireResist}}</dd> \n        <dt>Lightning</dt><dd>{{lightningResist}}</dd> \n        <dt>Physical</dt><dd>{{physicalResist}}</dd> \n        <dt>Poison</dt><dd>{{poisonResist}}</dd> \n      </dl>\n    </div>\n    <div class="span4">\n      <h3>Misc</h3>\n      <dl>\n        <dt>Gold find</dt><dd>{{#toPercent}}{{goldFind}}{{/toPercent}}</dd>\n        <dt>Magic Find</dt><dd>{{#toPercent}}{{magicFind}}{{/toPercent}}</dd>\n        <dt>Life Per Kill</dt><dd>{{lifePerKill}}</dd>\n        <dt>Life On Hit</dt><dd>{{lifeOnHit}}</dd>\n        <dt>Thorns</dt><dd>{{thorns}}</dd>\n      </dl>\n    </div>\n  </div>\n  {{/stats}}\n  \n  <div class="row-fluid">\n    <div class="accordion" id="accordion">\n      <div class="accordion-group">\n        <div class="accordion-heading">\n          <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#items">\n            Items\n          </a>\n        </div>\n        <div id="items" class="accordion-body collapse">\n          <div class="accordion-inner">\n            <ul class="row-fluid items">\n            {{#items}}\n                <li class="{{identifier}} {{displayColor}} span3" id="{{getApiId}}">\n                  <h4>{{name}}</h4>\n                </li>\n            {{/items}}\n            </ul>\n          </div>\n        </div>\n      </div>\n      <div class="accordion-group">\n        <div class="accordion-heading">\n          <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#active-skills">\n            Active skills\n          </a>\n        </div>\n        <div id="active-skills" class="accordion-body collapse skills">\n          <div class="accordion-inner">\n            <div class="12">\n              <ul class="row-fluid skills">\n              {{#activeSkills}}\n                <li class="span4">\n                  <h4>{{name}} {{#rune}}<small>{{name}}</small>{{/rune}}</h4>\n                  <p>{{{htmlDescription}}}</p>\n                  {{#rune}}\n                  <div class="well">\n                    <h5>{{name}}</h5>\n                    <p>{{description}}</p>\n                  </div>\n                  {{/rune}}\n                </li>\n              {{/activeSkills}}\n              </ul>\n            </div>\n          </div>\n        </div>\n      </div>\n      <div class="accordion-group">\n        <div class="accordion-heading">\n          <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#passive-skills">\n            Passive skills\n          </a>\n        </div>\n        <div id="passive-skills" class="accordion-body collapse">\n          <div class="accordion-inner">\n            <div class="span12">\n              <ul class="row-fluid skills">\n              {{#passiveSkills}}\n                <li class="span4">\n                  <h4>{{name}} {{#rune}}<small>{{name}}</small>{{/rune}}</h4>\n                  <p>{{{htmlDescription}}}</p>\n                </li>\n              {{/passiveSkills}}\n              </ul>\n            </div>\n          </div>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n</div>';

  templates.item_detail = '<h4>{{name}}</h4>\n<ul class="attr">\n{{#attributes}}\n  <li>{{.}}</li>\n{{/attributes}}\n{{^attributes}}\n  <li>No attributes</li>\n{{/attributes}}\n</ul>\n<ul class="gems">\n{{#gems}}\n  <li class="gem {{displayColor}}">{{attributes}}<br /><small>{{name}}</small></li>\n{{/gems}}';
