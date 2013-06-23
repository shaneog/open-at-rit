// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// TODO set up jslint and maybe a doc tool for this file

// A collection of helper methods that act on all Locations being displayed.
var Locations = {

  // Updates various styling properties within the UI. Designed to be called on
  // page load and on window resize.
  updateUI: function () {
    Locations.syncHeights();
    Locations.verticalPull();
  },

  // Syncs the heights of all the divs that represent Locations. Every Location
  // should have the same height as the tallest Location in its row.
  syncHeights: function () {
    // TODO remove this log message when it is no longer needed
    console.log("syncing heights...");
    var maxHeight = Locations.getMaxHeight();
    $('.location').css('height', maxHeight);
  },

  // Vertically centers any elements of the pull-middle class within their
  // parent elements.
  verticalPull: function () {
    $(".pull-middle").each(function () {
      var offset = $(this).parent().height() / 2 - $(this).height() / 2;
      $(this).css("margin-top", offset);
    });
  },

  // Gets the maximum height of all Locations being displayed.
  getMaxHeight: function () {
    var heights = $(".location").map(function () {
      return $(this).height();
    }).get();

    return Math.max.apply(null, heights);
  }

};

// When the document is done loading or the window is resized, update the UI.
$(function () {
  Locations.updateUI();
  $(window).resize(Locations.updateUI());
});
