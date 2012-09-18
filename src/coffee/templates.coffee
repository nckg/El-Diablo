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
    <div class="container-fluid" id="name">
      <div class="row-fluid">
        <h1>{{name}} <small>level <strong>{{level}}</strong>{{{getParagonLevel}}} {{class}}</small></h1>
      </div>
    </div>
    {{#stats}}
    <div class="container-fluid">
      <div class="row-fluid" id="stats">
        <div class="span2">
          <h2>Offense</h2>
        </div>
        <div class="span2">
          <h2>Defense</h2>
        </div>
        <div class="span2">
          <h2>Life</h2>
        </div>
        <div class="span2">
          <h2>Resource</h2>
        </div>
        <div class="span2">
          <h2>Adventure</h2>
        </div>
      </div>
      {{/stats}}
    
      <div class="row-fluid">
        <h2>Items</h2>
        <div id="items">
          <div id="hero-body" class="span3">
            <img src="img/body.png" />
            <ul id="gems">
              {{#items}}
              <li id="{{getApiId}}-gems" class="{{identifier}}"></li>
              {{/items}}
            </ul>
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

templates.gems = '''
    {{#gems}}
        <span class="gem {{id}}">{{icon}}</span>
    {{/gems}}
'''