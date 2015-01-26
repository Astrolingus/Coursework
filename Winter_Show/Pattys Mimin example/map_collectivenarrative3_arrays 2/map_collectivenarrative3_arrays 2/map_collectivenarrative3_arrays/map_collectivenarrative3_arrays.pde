import ddf.minim.*;

PImage map; 
Minim minim;

Button myButtons[]; 
AudioPlayer myPlayers[]; 
PImage shoes[]; 


void setup() {
  size (1580, 900); 
  map= loadImage("map.PNG"); 

  
  myButtons = new Button[10];
  myPlayers = new AudioPlayer[10]; 
  shoes = new PImage[10]; 
 

  //load the audio files:
  minim = new Minim(this);
  
  myPlayers[0] = minim.loadFile("1Alex.mp3"); 
  myPlayers[1] = minim.loadFile ("2Surya.mp3");
  myPlayers[2] = minim.loadFile ("3Erica.mp3");
  myPlayers[3] = minim.loadFile ("4James.mp3"); 
  myPlayers[4] = minim.loadFile ("5mike.mp3");
  myPlayers[5] = minim.loadFile ("6Kaitlin.mp3"); 
  myPlayers[6] = minim.loadFile ("7Kleebs.mp3"); 
  myPlayers[7] = minim.loadFile ("8Atif.mp3"); 
  myPlayers[8] = minim.loadFile ("9Ben.mp3"); 
  myPlayers[9] = minim.loadFile ("10Allison.mp3");
  
  for (int i=0; i< 10; i++) {
    shoes[i] = loadImage ("shoes"+(i+1)+".png"); 
  }



  myButtons[0] = new Button (720, 135, 30, 30, myPlayers[0], shoes[0]); //alex
  myButtons[1] = new Button (990, 255, 30, 30, myPlayers[1], shoes[1] ); //surya
  myButtons[2] = new Button (260, 220, 30, 30, myPlayers[2], shoes[2] ); //erika
  myButtons[3] = new Button (676, 160, 30, 30, myPlayers[3], shoes[3]); //james   
  myButtons[4] = new Button (290, 220, 30, 30, myPlayers[4], shoes[4] ); //mike  
  myButtons[5] = new Button (323, 160, 30, 30, myPlayers[5], shoes[5]); //kaitlin
  myButtons[6] = new Button (353, 168, 30, 30, myPlayers[6], shoes[6] ); //mark kleeb
  myButtons[7] = new Button (950, 225, 30, 30, myPlayers[7], shoes[7]); //atif
  myButtons[8] = new Button (290, 180, 30, 30, myPlayers[8], shoes[8]); //ben
  myButtons[9] = new Button (165, 170, 30, 30, myPlayers[9], shoes[9] ); //allison
}

void draw() {
  image (map, -130, -20, 1700, 900); 
  
  for (int i= 0; i<10; i++) {
    myButtons[i].display(mouseX, mouseY, mousePressed); 
  }


  println ( mouseX + "," + mouseY );
}

