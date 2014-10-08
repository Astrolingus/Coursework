// Variable to hold the poem
var poem;
var newpoem;

//variables for generating new words
var sylstart=['cab','sta','bli','gru','spe','schwa','not','vor','pla','phro']; //the start of the new word
var sylmiddle=['ga','mo','pe','bi','chu','tho','ji','ca','tu','fe','la']; //middle bits of the new word
var sylend=['ment','tion','lig','thy','wabe','sy','wock','ious','tum','fish']; //the end of the new word

//variable to hold the long words (the matches)
var matches; // array of matches
var newwordlist; //array of new words

//the regular expression used
var regex=/^\w{5,20}$/; //regex

// Uploading text
function preload()
{

  loadStrings('Jabberwocky.txt', fileready); //fileready will prepare and format "poem"
  newpoem=poem; //so now make newpoem==poem
}

function setup()
{
  noCanvas(); //remove the canvas

  //generate a list of nonsense words, one for each word of 5-letters or more in the poem
  matches = poem.match(regex);
  for(var i=0;i<matches.length;i++)
  {
    var newword=makeNewWord(matches[i]);
    newwordlist.push(newword);
  }

  //now replace each word in the newpoem with the corresponding nonsense word
  for(var j=0;j<matches.length;j++)
    {
      newpoem.replace(matches[j],newwordlist[j]);
    }

    //now output the text as a div
    createDiv('Jabberwocky'+'br/'+newpoem);
}


//OTHER FUNCTIONS//
//reformat the uploaded text
function fileready(lines)
{
  // join() joins the elements of an array
  // Pass in a line break to retain formatting
  poem = lines.join('<br/>');
  //createP(text);
}
///////////////////////////////////////////////////////

function makeNewWord(word)//makes a new word using same number of syllables as word
{
var tempword; //variable returned
var count=countSyllables(word);
tempword+=sylstart[Math.floor((Math.random() * 10))]; //add the beginning of the word
for(var j=1;j<count-1;j++)
  {
    tempword+=symiddle[Math.floor((Math.random() * 10))]; //add the middle portions
  }
tempword+=sylend[Math.floor((Math.random() * 10))]; //add the end of the word

return tempword;
}
////////////////////////////////////////////////////////

function countSyllables(word) //count the number of syllables in a word
{
  var syl;//the number of syllables
  var vowel=false; //whether or not we have a vowel
  var wordlength=word.length;

  //roughly, every time you have a vowel, you have a new syllable
  //this isn't going to react to syllabic consonants
  for(var i=0;i<wordlength;i++)
    {
      if(isVowel(charAt(word(i))) && vowel==false)
        {
          vowel=true;
          syl++;
        }
        else if (isVowel(word.charAt(i)) && (vowel == true))
          {
            vowel=true; //don't count another syllable, because double vowel
          }
          else
            {
              vowel=false;
            }
    }
    // Check for 'e' at the end, as long as not a word with one syllable
    //again this is rough. "Gobble" will register as only one vowel after this part is executed
      var tempChar = word.charAt(word.length-1);
      if (((tempChar == 'e') || (tempChar == 'E')) && (syl != 1))
    {
    syl--;
    }
    //////////////////////////////////////////////////////////
    // Check if a char is a vowel (count y)
    function isVowel(c)
    {
      if      ((c == 'a') || (c == 'A')) { return true;  }
      else if ((c == 'e') || (c == 'E')) { return true;  }
      else if ((c == 'i') || (c == 'I')) { return true;  }
      else if ((c == 'o') || (c == 'O')) { return true;  }
      else if ((c == 'u') || (c == 'U')) { return true;  }
      else if ((c == 'y') || (c == 'Y')) { return true;  }
      else                               { return false; }
    }
    //////////////////////////////////////////////////////////
