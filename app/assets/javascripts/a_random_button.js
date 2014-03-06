var RandomButton = function(el) {
  this.$el = el;
  this.route();
}

RandomButton.prototype.route = function() {
  this.$el.click(function(){
    $.ajax({
      method: "POST",
      url: "/sketches/random",
      success: function(response){
        window.location.href = response["path"];
      },
      dataType: "json"
    });
  });
}

$(document).ready(function(){
  
  var navRandButtonEl = $("#nav-random-button");
  var bodyRandButtonEl = $("#home-random-button");

  var randButton = new RandomButton(navRandButtonEl);
  var randButton = new RandomButton(bodyRandButtonEl);
});