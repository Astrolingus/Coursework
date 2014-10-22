var soundButton, hiddenSound;

//main method, sort of...
$(document).ready(init);

var init = function()
{
console.log("hello");
  soundButton = $('#sound');
  hiddenSound = $('#popUpSound');

  // register all the event listeners
  soundButton.on('click', showPopUp);
  hiddenSound.on('click', hidePopUp);
};


var showPopUp = function()
{

hiddenSound.show();
}

var hidePopUp = function()
{
  hiddenSound.hide();
}
/*
function showPopUp() {
  var popup = document.getElementById('popUpSound');
  popup.style.display = 'block';
  popup.addEventListener('click', hidePopUp);
};


function hidePopUp(){
  var popup = document.getElementById('popUpSound');
  popup.style.display = 'none';
}

window.addEventListener('load', init);
*/
