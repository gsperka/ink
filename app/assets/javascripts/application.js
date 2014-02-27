//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var onLoad = function() {
  var modal = new Modal();
}

$(document).ready(onLoad);
$(window).bind('page:change', onLoad);