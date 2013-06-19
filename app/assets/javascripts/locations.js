// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// TODO set up jslint and maybe a doc tool for this file

// A collection of helper methods that act on all Locations being displayed.
var Locations = {

  // Syncs the heights of all the divs that represent Locations. Every Location
  // should have the same height as the tallest Location in its row.
  syncHeights: function () {
    // TODO remove this log message when it is no longer needed
    console.log("syncing heights...");
    var maxHeight = Locations.getMaxHeight();
    $('.location').css('height', maxHeight);
  },

  // Gets the maximum height of all Locations being displayed.
  getMaxHeight: function () {
    var heights = $(".location").map(function () {
      return $(this).height();
    }).get();

    return Math.max.apply(null, heights);
  }

};

// When the document is ready, sync heights initially and then trigger it
// whenever the window is resized.
$(function () {
  Locations.syncHeights();
  $(window).resize(Locations.syncHeights);
});
