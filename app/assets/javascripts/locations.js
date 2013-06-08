// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var Locations = {
  syncHeights: function () {
    console.log("syncing heights...");
    $('.location').css('height', $('.location').height());
  }
};

$(function () {
  Locations.syncHeights();
  $(window).resize(Locations.syncHeights);
});
