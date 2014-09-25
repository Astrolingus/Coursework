// add icons
$('.playspace').append('<i class="em em-person_with_blond_hair"></i>');
$('.playspace').append('<i class="em em-woman"></i>');
$('.playspace').append('<i class="em em-baby"></i>');
$('.playspace').append('<i class="em em-necktie"></i>');
$('.playspace').append('<i class="em em-dress"></i>');

// set the initial positions

$('.em-person_with_blond_hair').css({
  top: 200,
  left: 300
});

$('.em-woman').css({
  top: 200,
  left: 100
});


// play!

$('.em-person_with_blond_hair').animate({
  left: 50
}, 1000);

$('.woman').animate({
  left: 0
}, 1000);

// after 660ms...
//setTimeout(function() {
  // ...move the ball
  //$('.fa-futbol-o').animate({
    //left: 0
  //}, 800, 'easeOutQuart');
//}, 660);
