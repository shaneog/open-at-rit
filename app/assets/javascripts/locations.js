// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var Locations = {
  syncHeights: function () {
    $('.location').css('height', $('.location').height());
  }
};

$(function () {
  Locations.syncHeights();
});
