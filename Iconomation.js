// add icons
$('.playspace').append('<i class="em em-person_with_blond_hair"></i>');
$('.playspace').append('<i class="em em-woman"></i>');


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

$('.em-woman').animate({
  left: 195
}, 1000);

$('.em-person_with_blond_hair').animate({
  left: 197
}, 1000);




//after 660ms...
setTimeout(function() {
  //place baby

  $('.playspace').append('<i class="em em-baby"></i>');

  $('.em-baby').css({
    top: 210,
    left: 196
  });

}, 660);
