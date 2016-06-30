// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require bootstrap
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require fancybox
//= require jquery.flexslider.js
//= require easing.js
//= require wow.min.js
//= require jquery.ui.totop.js
//= require app.js


$(document).ready(function() {
  $("a.fancybox").fancybox();
  $('.tip').tooltip()

  $.widget( "custom.catcomplete", $.ui.autocomplete, {
    _create: function() {
      this._super();
      this.widget().menu( "option", "items", "> :not(.ui-autocomplete-category)" );
    },
    _renderMenu: function( ul, items ) {
      var that = this,
        currentCategory = "";
      $.each( items, function( index, item ) {
        var li;
        if ( item.category != currentCategory ) {
          ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
          currentCategory = item.category;
        }
        li = that._renderItemData( ul, item );
        if ( item.category ) {
          li.attr( "aria-label", item.category + " : " + item.label );
        }
      });
    }
  });

  if ($('.datatable').length > 0) {
    lang_url = $('.parts.container').data('lang')
    $('.datatable').DataTable({
      iDisplayLength: 25,
      language: {
          url: lang_url
      }
    });
    $('.datatable').removeClass('hidden')
  }

  $('.part_name').click(function(event) {
    $('.loading').removeClass('hidden')
  });

});

jQuery(function() {
  return $('#query').autocomplete({
    delay: 0,
    minLength: 3,
    source: $('#query').data('autocomplete-source'),
    close: function( event, ui ) {
      // $('.search_form').submit();
    }
  });
});
