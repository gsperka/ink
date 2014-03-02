var i=0;
$('#bigbigbox').mousemove(function(event) {
  var msg = 'mousemove() position - x : ' + event.pageX + ', y : '
                + event.pageY + ' [counter] : ' + i++;
  $('#msg').text(msg);
});