var soundButton, hiddenSound;


function init()
{

  // show and hide the popup
  $('#sound').click(function() { $('#popUpSound').show(); });
  $('#popUpSound').click(function() { $('#popUpSound').hide(); });

  $('#look').click(function() { $('#popUpLook').show(); });
  $('#popUpLook').click(function() { $('#popUpLook').hide(); });

  $('#interests').click(function() { $('#popUpInterests').show(); });
  $('#popUpInterests').click(function() { $('#popUpInterests').hide(); });

  $('#girl').click(function() { $('#popUpGirl').show(); });
  $('#popUpGirl').click(function() { $('#popUpGirl').hide(); });

  $('#nice').click(function() { $('#popUpNice').show(); });
  $('#popUpNice').click(function() { $('#popUpNice').hide(); });

  $('#men').click(function() { $('#popUpMen').show(); });
  $('#popUpMen').click(function() { $('#popUpMen').hide(); });

}



//main method, sort of...
//why does moving this from top to bottom help?
$(document).on('ready',init);


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
