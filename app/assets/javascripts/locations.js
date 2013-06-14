// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// TODO set up jslint and maybe a doc tool for this file

var Locations = {

  syncHeights: function () {
    // TODO remove this log message when it is no longer needed
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
