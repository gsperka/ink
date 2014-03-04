// var Modal = function(el) {
//   this.el = el
//   $(this.el).find('#overlay').hide();
//   $(this.el).find('#login_modal').hide();
//   $(this.el).find('#login_modal').css({'margin-left': '-' + (($('#login_modal').width() / 2) + parseInt($("#login_modal").css('padding-left'))) + 'px'});
//   $(this.el).find('#login_modal').css({'margin-top': '-' + ($('#login_modal').width() / 2) + 'px'});

//   this.login();
//   this.clickOff();
// };

// Modal.prototype.login = function() {
//   self = this.el
//   $(this.el).find('#login').on('click', function(event) {


//     $(self).find('#overlay').show();
//     $(self).find('#login_modal').show();
//   });
// };

// Modal.prototype.clickOff = function() {
//   self = this.el
//   $(this.el).find('#overlay, #nav').click(function() {
//     $(self).find('#overlay').hide();
//     $(self).find('#login_modal').hide();
//   })
// }

// $(document).ready(function() {
//   var modal = new Modal('body');
// });
