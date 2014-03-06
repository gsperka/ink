var RandomButton = function(el) {
  console.log("This is this for RandomButton object");
  console.log(this);
}

$(document).ready(function(){
  var navRandButtonEl = $("#nav-random-button");
  var bodyRandButtonEl = $("#home-random-button");

  var randButton = new RandomButton('navRandButtonEl');
  var randButton = new RandomButton('bodyRandButtonEl');
});