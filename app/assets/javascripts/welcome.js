          	// var controller;
          	// $(document).ready(function($) {
          	// 	// init controller
          	// 	controller = new ScrollMagic({vertical: false});
          	// });

$(document).ready(function() {
    var bodyheight = $(window).height();
    $(".bg1").height(bodyheight);
});

// for the window resize
$(window).resize(function() {
    var bodyheight = $(window).height();
    $(".bg1").height(bodyheight);
});
