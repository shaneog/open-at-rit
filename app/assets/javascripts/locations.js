// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var Locations = {

  syncHeights: function () {
    console.log("syncing heights...");
    var maxHeight = Locations.getMaxHeight();
    $('.location').css('height', maxHeight);
  },

  getMaxHeight: function () {
    var heights = $(".location").map(function () {
      return $(this).height();
    }).get();

    return Math.max.apply(null, heights);
  }

};

$(function () {
  Locations.syncHeights();
  $(window).resize(Locations.syncHeights);
});
