/*Adapted from Daniel Shiffman*/

function Concordance() {
  this.hash = {};
  this.keys = [];


  // Splitting up the text
  function split(text) {
    // Split into array of tokens
    return text.split(/\W+/);
  }

  // A function to validate a token
  function validate(token) {
    return /\w{2,}/.test(token);
  }

  // Process new text
  this.process = function(data) {
    var tokens = split(data); //split into words, and perform letter-count on each word
    // For every token
    for (var i = 0; i < tokens.length; i++) {
      // Lowercase everything to ignore case
      var token = tokens[i].toLowerCase();
      if (validate(token)) {
        // go through the letters
        for(var j=0; j<token.length;j++)
          {
            var currentLetter=token.charAt(j);
            this.increment(currentLetter);
          }

      }
    }
  }

  // An array of keys
  this.getKeys = function() {
    return this.keys;
  }

  // Get the count for a letter
  this.getCount = function(letter) {
    return this.hash[letter];
  }

  // Increment the count for a letter
  this.increment = function(letter) {
    // Is this a new letter?
    if (this.hash[letter] == undefined) {
      this.hash[letter] = 1;
      this.keys.push(letter);
    // Otherwise just increment its count
    } else {
      this.hash[letter]++;
    }
  }

  // Sort array of keys by counts
  this.sortByCount = function() {
    // A fancy way to sort each element
    // Compare the counts
    var dict = this;
    this.keys.sort(function(a,b) {
      return (dict.getCount(b) - dict.getCount(a));
    });
  }

}
