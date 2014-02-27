var Modal = function() {
  $('#overlay').hide();
  $('#login_modal').hide();
  $('#login_modal').css({'margin-left': '-' + (($('#login_modal').width() / 2) + parseInt($("#login_modal").css('padding-left'))) + 'px'});
  $('#login_modal').css({'margin-top': '-' + ($('#login_modal').width() / 2) + 'px'});
  
  this.login();
  this.clickOff();
};

Modal.prototype.login = function() {
  $('#login').on('click', function(event) {
    event.preventDefault();

    $('#overlay').show();
    $('#login_modal').show();
  });
};

Modal.prototype.clickOff = function() {
  $('#overlay, #nav').click(function() {
    $('#overlay').hide();
    $('#login_modal').hide();
  })
}