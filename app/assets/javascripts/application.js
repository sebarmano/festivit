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

$(document).ready(function() {
  $(".button-subtract").click(function(e) {
    e.preventDefault();
    elm = $(this).parent().children(".tickets-pu");
    var val = elm.val();
    elm.val(Number(val)-1);


    elm2 = $(this).parent().parent().children(".card-stats").find("span")
    var rem = elm2.html();
    elm2.html(Number(rem)+1);
    
    console.log(rem);
    console.log(val);
    if(val < 2) {
      $(this).off('click')
    }
  });

  $(".button-add").click(function(e) {
    e.preventDefault();
    elm = $(this).parent().children(".tickets-pu");
    var val = elm.val();
    elm.val(Number(val)+1);

    elm2 = $(this).parent().parent().children(".card-stats").find("span")
    var rem = elm2.html();
    elm2.html(Number(rem)-1);

    if(rem < 2) {
      $(this).off('click')
    }
  });
});
