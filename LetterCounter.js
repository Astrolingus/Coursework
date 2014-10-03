// Adapted from code by Daniel Shiffman


var concordance;

function setup() {



  // Make a concordance object
  // This will hold every lettetter and its count
  concordance = new Concordance();

  // For drag and dropping files
  setupDropZone();

  // Just loading from a file for simplicity
  // var stuff = loadStrings('data/test.txt', process);
}


function process(data) {
  var text;

  // Did we get an array from loadStrings()
  // or just some raw text
  if (data instanceof Array) {
    text = data.join(' ');
  } else {
    text = data;
  }

  // Process this data
  concordance.process(text);

  // Sort
  concordance.sortByCount();

  // If this gets called multiple times we're removing all the divs that show counts
  // before making new ones
  clearDivs();

  // Get all the letters
  var keys = concordance.getKeys();

  // Get the count for each letter and display
  for (var i = 0; i < keys.length; i++) {
    var count = concordance.getCount(keys[i]);
    var div = createDiv(keys[i] + ': '+ count);
    div.class('concordance');
  }
}

// Go through and remove all the divs
function clearDivs() {
  var divs = getElements('concordance');
  for (var i = 0; i < divs.length; i++) {
    divs[i].remove();
  }
}

function draw()
{
  ellipse(56,46,55,55)
}