
window.ElDiablo = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  init: function() {
    console.log('Hello from Backbone!');
    
    // Initiate the router
    var app_router = new ElDiablo.Router();
    // Start Backbone history a neccesary step for bookmarkable URL's
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ElDiablo.init();
});
