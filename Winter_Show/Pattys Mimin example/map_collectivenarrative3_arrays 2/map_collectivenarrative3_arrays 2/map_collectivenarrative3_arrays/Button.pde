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
  }

}

