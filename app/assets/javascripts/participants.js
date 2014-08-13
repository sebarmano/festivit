$(document).ready(function() {
    var bodyheight = $(window).height();
    $(".bgcont").height(bodyheight);
});

// for the window resize
$(window).resize(function() {
    var bodyheight = $(window).height();
    $(".bgcont").height(bodyheight);
});
