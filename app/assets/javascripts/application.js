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
//= require jquery_ujs
//= require cocoon
//= require_tree .

$(function() {
  $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});

$(function() {
    // limits the number of categories
    $('.attachments').bind('cocoon:after-insert', function() {
        check_to_hide_or_show_add_link();
    });

    $('.attachments').bind('cocoon:after-remove', function() {
        check_to_hide_or_show_add_link();
    });

    check_to_hide_or_show_add_link();

    function check_to_hide_or_show_add_link() {
        if ($('.photos .nested-fields').length == 3) {
            $('.add_photo').hide();
        } else {
            $('.add_photo').show();
        }
        if ($('.videos .nested-fields').length == 3) {
            $('.add_video').hide();
        } else {
            $('.add_video').show();
        }
        if ($('.songs .nested-fields').length == 3) {
            $('.add_song').hide();
        } else {
            $('.add_song').show();
        }
    }
})

$(document).ready(function() {
  $(".button-subtract").click(function(e) {
    e.preventDefault();
    elm = $(this).parent().children(".tickets-pu");
    var val = elm.val();
    elm.val(Number(val)-1);
  });

  $(".button-add").click(function(e) {
    e.preventDefault();
    elm = $(this).parent().children(".tickets-pu");
    var val = elm.val();
    elm.val(Number(val)+1);
  });
});
