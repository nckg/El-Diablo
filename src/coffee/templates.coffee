# All of the client-side templates we use. These are probably more
# "partials" than full-fledged templates, and from the perspective of
# mustache.js we use the two concepts interchangeably, as we define partials in
# the global `templates` Array.
window.templates = []

templates.hero_overview = '''
  <div class="row-fluid" id="hero-overview">
    {{#heroes}}
    <div class="span3 hero {{class}}">
      <a href="#{{id}}" data-id="{{id}}">
        <h4>{{name}}</h4>
        <span class="{{class}} level">{{level}}</span>
        <p class="classname">{{class}}{{{getParagonLevel}}}</p>
      </a>
    </div>
		{{/heroes}}
  </div>
'''

templates.hero_detail = '''
  <div id="hero-detail" class="{{class}}">
    <div class="row-fluid" id="name">
      <h1>{{name}} <small>level <strong>{{level}}</strong> {{class}}{{{getParagonLevel}}}</small></h1>
    </div>
    {{#stats}}
    <div class="row-fluid" id="stats">
      <div class="span4">
        <h3>Core stats</h3>
        <dl>
          <dt class="demon-hunter monk">Dexterity</dt>
          <dd class="demon-hunter monk">{{dexterity}}</dd> 
          <dt class="wizard witch-doctor">Intelligence</dt>
          <dd class="wizard witch-doctor">{{intelligence}}</dd> 
          <dt class="barbarian">Strength</dt>
          <dd class="barbarian">{{strength}}</dd> 
          <dt>Vitality</dt>
          <dd>{{vitality}}</dd> 
          <dt>Armor</dt>
          <dd>{{armor}}</dd> 
          <dt>Life</dt>
          <dd>{{life}}</dd> 
          <dt>Damage</dt>
          <dd>{{damage}}</dd>
        </dl>
      </div>
      <div class="span4">
        <h3>Resists</h3>
        <dl>
          <dt>Arcane</dt><dd>{{arcaneResist}}</dd> 
          <dt>Cold</dt><dd>{{coldResist}}</dd> 
          <dt>Fire</dt><dd>{{fireResist}}</dd> 
          <dt>Lightning</dt><dd>{{lightningResist}}</dd> 
          <dt>Physical</dt><dd>{{physicalResist}}</dd> 
          <dt>Poison</dt><dd>{{poisonResist}}</dd> 
        </dl>
      </div>
      <div class="span4">
        <h3>Misc</h3>
        <dl>
          <dt>Gold find</dt><dd>{{#toPercent}}{{goldFind}}{{/toPercent}}</dd>
          <dt>Magic Find</dt><dd>{{#toPercent}}{{magicFind}}{{/toPercent}}</dd>
          <dt>Life Per Kill</dt><dd>{{lifePerKill}}</dd>
          <dt>Life On Hit</dt><dd>{{lifeOnHit}}</dd>
          <dt>Thorns</dt><dd>{{thorns}}</dd>
        </dl>
      </div>
    </div>
    {{/stats}}
    
    <div class="row-fluid">
      <div class="accordion" id="accordion">
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#items">
              Items
            </a>
          </div>
          <div id="items" class="accordion-body collapse">
            <div class="accordion-inner">
              <ul class="row-fluid items">
              {{#items}}
                  <li class="{{identifier}} {{displayColor}} span3" id="{{getApiId}}">
                    <h4>{{name}}</h4>
                  </li>
              {{/items}}
              </ul>
            </div>
          </div>
        </div>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#active-skills">
              Active skills
            </a>
          </div>
          <div id="active-skills" class="accordion-body collapse skills">
            <div class="accordion-inner">
              <div class="12">
                <ul class="row-fluid skills">
                {{#activeSkills}}
                  <li class="span4">
                    <h4>{{name}} {{#rune}}<small>{{name}}</small>{{/rune}}</h4>
                    <p>{{{htmlDescription}}}</p>
                    {{#rune}}
                    <div class="well">
                      <h5>{{name}}</h5>
                      <p>{{description}}</p>
                    </div>
                    {{/rune}}
                  </li>
                {{/activeSkills}}
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#passive-skills">
              Passive skills
            </a>
          </div>
          <div id="passive-skills" class="accordion-body collapse">
            <div class="accordion-inner">
              <div class="span12">
                <ul class="row-fluid skills">
                {{#passiveSkills}}
                  <li class="span4">
                    <h4>{{name}} {{#rune}}<small>{{name}}</small>{{/rune}}</h4>
                    <p>{{{htmlDescription}}}</p>
                  </li>
                {{/passiveSkills}}
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
'''

templates.item_detail = '''
  <h4>{{name}}</h4>
  <ul class="attr">
  {{#attributes}}
    <li>{{.}}</li>
  {{/attributes}}
  {{^attributes}}
    <li>No attributes</li>
  {{/attributes}}
  </ul>
  <ul class="gems">
  {{#gems}}
    <li class="gem {{displayColor}}">{{attributes}}<br /><small>{{name}}</small></li>
  {{/gems}}
'''