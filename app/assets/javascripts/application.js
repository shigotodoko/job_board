// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {

  $('.facebook-share-button').click(function(e) {
    e.preventDefault();

    var href = $(this).attr('href');

    window.open('https://www.facebook.com/sharer/sharer.php?u=' + href, 'sharer', 'width=626,height=436');
    return false;
  });

  $('.twitter-share-button').click(function(e) {
    e.preventDefault();

    var href  = $(this).attr('href');
    var title = encodeURIComponent($(this).attr('title'));


    window.open('http://twitter.com/share?url=' + href + '&text=' + title + '&', 'twitterwindow', 'height=450, width=550, top='+($(window).height()/2 - 225) +', left='+$(window).width()/2 +', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');

    return false;
  });

  $('.google-plus-share-button').click(function(e) {
    e.preventDefault();

    var href  = $(this).attr('href');

    window.open('https://plus.google.com/share?url=' + href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');

    return false;
  });

  App = {};

  App.displayProvinceName = $(".filter-by-province-name");
  App.prefectureFilter    = $('#prefecture_filter');

  App.SearchForm = {
    setDisplayText: function(prefectureName) {
      var $label = $('span.province-name');
      $label.text(prefectureName);
    },
    clearSelected: function() {
      var selecteds = document.querySelectorAll('.province-selected');

      $.each(selecteds, function(index, selected) {
        selected.classList.remove('province-selected');
      });
    },
    /*
     *
     * Redirects to a specific province posts.
     *
     */
    redirectTo: function(prefectureName) {
      var prefectureName = prefectureName.toLowerCase();
      window.location.href = 'https://www.shigotodoko.com/posts/tags/' + prefectureName;
    }
  }

  var mouseOverHandler = function() {
    var prefectureName  = $(this).data('province-name');
    var $label          = $('span.province-name');
    App.displayProvinceName.val(prefectureName).selected;

    // search for all provinces with class 'province-selected' and remove its class.
    App.SearchForm.clearSelected();

    // Display the province name on bottom of map.
    // $label.text(provinceName);
    App.SearchForm.setDisplayText(prefectureName);
  };

  var mouseOutHandler = function() {
    // do something
  };

  $("[id^='SVG']").each(function() {
    $(this).hover(mouseOverHandler, mouseOutHandler);
  });

  /*
   *
   * Sidebar Map Filter
   *
   */
  App.displayProvinceName.selectize({
    onChange: function(value) {
      var prefectureName = value;
      // search for all provinces with class 'province-selected' and remove its class.
      App.SearchForm.clearSelected();

      if (prefectureName) {
        // highlight the province block in map
        provinceMap = document.querySelector('[data-province-name="' + prefectureName + '"]');
        provinceMap.setAttribute('class', 'province-selected');

        // Display the province selected name on label.
        App.SearchForm.setDisplayText(prefectureName);

        setTimeout(function() {
          console.log('preparing to redirect..');
          App.SearchForm.redirectTo(prefectureName);
        }, 1500);
      }
    }
  });

  App.prefectureFilter.change(function() {
    var prefectureName = $(this).val().toLowerCase();
    window.location.href = 'https://www.shigotodoko.com/posts/tags/' + prefectureName;
  });

});
