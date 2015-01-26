import ddf.minim.*;

//Start the buttons
PImage map;  

//Button[] myButton = new Button[10];

Button myButton1; 
Button myButton2; 
Button myButton3; 
Button myButton4; 
Button myButton5; 
Button myButton6; 
Button myButton7; 
Button myButton8; 
Button myButton9; 
Button myButton10; 

//instantiate the player files 
Minim minim;
AudioPlayer player1;
AudioPlayer player2; 
AudioPlayer player3; 
AudioPlayer player4; 
AudioPlayer player5; 
AudioPlayer player6; 
AudioPlayer player7; 
AudioPlayer player8; 
AudioPlayer player9; 
AudioPlayer player10; 

PImage shoes1; 
PImage shoes2; 
PImage shoes3; 
PImage shoes4; 
PImage shoes5; 
PImage shoes6; 
PImage shoes7; 
PImage shoes8; 
PImage shoes9; 
PImage shoes10; 

void setup() {
  size (1580, 900); 
  map= loadImage("map.PNG"); 

  //load the audio files:
  minim = new Minim(this);
  player1 = minim.loadFile("1Alex.mp3"); 
  player2 = minim.loadFile ("2Surya.mp3"); 
  player3 = minim.loadFile ("3Erica.mp3");   
  player4 = minim.loadFile ("4James.mp3"); 
  player5 = minim.loadFile ("5mike.mp3"); 
  player6 = minim.loadFile ("6Kaitlin.mp3"); 
  player7 = minim.loadFile ("7Kleebs.mp3"); 
  player8 = minim.loadFile ("8Atif.mp3"); 
  player9 = minim.loadFile ("9Ben.mp3"); 
  player10 = minim.loadFile ("10Allison.mp3"); 


  shoes1 = loadImage ("shoes1.png"); 
  shoes2 = loadImage ("shoes2.png"); 
  shoes3 = loadImage ("shoes3.png"); 
  shoes4 = loadImage ("shoes4.png");   
  shoes5 = loadImage ("shoes5.png"); 
  shoes6 = loadImage ("shoes6.png"); 
  shoes7 = loadImage ("shoes7.png"); 
  shoes8 = loadImage ("shoes8.png"); 
  shoes9 = loadImage ("shoes9.png"); 
  shoes10 = loadImage ("shoes10.png"); 


  myButton1 = new Button (720, 135, 30, 30, player1, shoes1); //alex
  myButton2 = new Button (990, 255, 30, 30, player2, shoes2 ); //surya
  myButton3 = new Button (260, 220, 30, 30, player3, shoes3 ); //erika
  myButton4 = new Button (676, 160, 30, 30, player4, shoes4); //james   
  myButton5 = new Button (290, 220, 30, 30, player5, shoes5 ); //mike  
  myButton6 = new Button (323, 160, 30, 30, player6, shoes6); //kaitlin
  myButton7 = new Button (353, 168, 30, 30, player7, shoes7 ); //mark kleeb
  myButton8 = new Button (950, 225, 30, 30, player8, shoes8); //atif
  myButton9 = new Button (290, 180, 30, 30, player9, shoes9); //ben
  myButton10 = new Button (165, 170, 30, 30, player10, shoes10 ); //allison
}

void draw() {
  image (map, -130, -20, 1700, 900); 

  myButton1.display(mouseX, mouseY, mousePressed); 
  myButton2.display(mouseX, mouseY, mousePressed); 
  myButton3.display(mouseX, mouseY, mousePressed);
  myButton4.display(mouseX, mouseY, mousePressed);
  myButton5.display(mouseX, mouseY, mousePressed);
  myButton6.display(mouseX, mouseY, mousePressed);
  myButton7.display(mouseX, mouseY, mousePressed);
  myButton8.display(mouseX, mouseY, mousePressed);
  myButton9.display(mouseX, mouseY, mousePressed);
  myButton10.display(mouseX, mouseY, mousePressed);

  println ( mouseX + "," + mouseY );
}


class Button {

  float x; 
  float y; 
  float w; 
  float h; 
  AudioPlayer player; 

  float x1line;  
  float x2line; 
  float y1line; 
  float y2line; 

  PImage hover; 
  PImage regular; 
  PImage shoes; 
  
  // every button should know where NYC is
  int nycX = 356;
  int nycY = 203;
  
  
  // keep track of button state
  // state 0 = regular, button not clicked, mouse nowhere near the button
  // state 1 = hover, but not clicked, but mouse close
  // state 2 = clicked, music playing, shoes displayed
  // state 3 = clicked, music not playing, shoes shrinking
  int state = 0;
  
  
  int shoeSize = 500;
  
  float xChange = 0.0;
  float yChange = 0.0;
  
  int shoeFrameRate = 50;


  //constructor
  Button (float _x, float _y, float _w, float _h, AudioPlayer _player, PImage _shoes) {

    x = _x;
    y = _y;
    w = _w;
    h = _h;
    player = _player; 
    shoes = _shoes;
    //the two images that will be used
    hover = loadImage ("steps_hover.png"); 
    regular = loadImage ("steps_regular.png");

    // figure out the change values for when the shoe decides to go away
    xChange = (nycX - x) / (float)shoeFrameRate;
    yChange = (nycY - y) / (float)shoeFrameRate;

  }
  //the display funciton
  void display (int mx, int my, boolean mp) 
  {
    // figure out what state we should be in

    // how far is the mouse?    
    float distance = dist(mx, my, x+w/2, y+h/2); 
  //  println("The distance is" +  distance ); 
    
    // if we are in state 0 or 1 we need to know about distance
    if (state == 0)
    {
      // are we close now?
      if (distance <w/2)
      {
        // jump over to hover mode
        state = 1; 
      }
    }
    
    // state 1 = hover
    else if (state == 1)
    {
      // have we clicked the mouse?
      if (distance < w/2 && mp == true)
      {
        // switch to state 2!
        state = 2; 
        
        // queue up the music
        player.rewind(); 
        player.play();
      }
      
      // are we far away?  if so, go back to state 0
      if (distance > w/2)
      {
        state = 0; 
      }
    }
    
    // state 2 = music playing
    else if (state == 2)
    {
      println(player.isPlaying() );
      
      // ask the player to see if it's still playing
      if (player.isPlaying() == false)
      {
        // state 3 time!
        state = 3;
      }  
    }
    
    // state 3 - the last one!
    else if (state == 3)
    {
       println("OK it's all over ..."); 
    }






    // once we know the state we can draw the approrpriate artwork
    // and trigger the appropriate music state
    if (state == 0)
    {
      image (regular, x, y, w, h); 
    }
    
    else if (state == 1)
    {
      // draw hover shoes at current location
      image (hover, x, y, w, h);
    }
    
    // state 2!
    else if (state == 2)
    {
      // image the picture at this size
      image(shoes, x, y, shoeSize, shoeSize);       
    }
    
    // state 3 - we need to make the shoes smaller
    else if (state == 3)
    {
       // decrease shoe size by some amount
       shoeSize = shoeSize - (500/shoeFrameRate);
       
       // just use the values we calculated in the constructor
       x = x + xChange;
       y = y + yChange;
       
       // draw the shoes at their new size
       image(shoes, x, y, shoeSize, shoeSize);
      
       if (shoeSize == 0)
       {
         state = 4;
       } 
    }

    
    
   /*   
    
    
    
    // draw shoes in their current position
    image (regular, x, y, w, h); 
    
    println("The regular image has been loaded"); 
    
    //calculate the distance for the hovering and the mousepressed. 

    // if the mouse is close to the shoes AND the mouse is down OR the music is playing
    if (distance <w-5 && mp == true  || player.isPlaying()) 
    { 
      // draw hover shoes at current location
      image (hover, x, y, w, h);
      
      println("The hover image has been drawn");
      println("the mouse is pressed and the distance is shorter than w-5"); 
      // image (shoes, x, y); 
      if (player.isPlaying() == false) {
        player.rewind(); 
        player.play();
        println ("the player is now playing");
        
        // keep track that we've started the audio
        audioHasBeenStarted = true;
      }
      
      // image the picture at this size
      image(shoes, x, y, 500, 500); 
      println ("the shoe image has been drawn");
    }
    
    else if (distance <w-5 && mp == false && !player.isPlaying()) { //not isplaying
      image (hover, x, y, w, h);
    }

    else if (player.isPlaying() == false) {
      image (regular, x, y, w, h);
      println("the footprints image has bee drawn to the screen");
    }
    
    */
  }
}


