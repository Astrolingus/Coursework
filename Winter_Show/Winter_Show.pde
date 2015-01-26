import ddf.minim.*;

//The arrays 
String[] countbystate; //uploaded data for countsbystate.txt
String [] descriptions; // uploaded data from descriptions.txt
ArrayList <State> statelist; //the list of all states

//The voices and sounds
Minim minim;


//Whether to show title screen, credits and description
boolean showtitles;
boolean showcredits;
boolean showdescription; //included text description and audio narrative

//The current state, whose description we're showing
State currentstate;

//Font used
PFont font1; //small font
PFont font2; //large font

//Map
PImage map;//main map
PImage map2; //background map

//cursor
PImage clickcursor;

//Background for the second map
PGraphics canvas;

//buttons
Button titlesexit; //the button on the title screen to exit the titles and view map
Button creditsexit; // button on the credits screen to exit credits and view map
Button descriptionexit;// button to quit a description when
Button titlesshowbutton; //button on the map screen to show the titles again
Button creditsshowbutton; //the button on the map screen to show the credits

////////////////////////////////////////
void setup()
{
  size(displayWidth, displayHeight);

  //load the main map
  map = loadImage("USATestMap3GreenBlackDataColours.png");
  map.resize(width, height); //resize the image to fit the screen

  //load cursors
  clickcursor=loadImage("clickicon.png");
  clickcursor.resize(32, 32);


  //set the canvas as map2
  canvas = createGraphics(width, height);
  map2=loadImage("USATestMap3GreenBlackColours.png");
  map2.resize(width, height); //resize the image to fit the screen
  canvas.beginDraw();
  canvas.background(map2);
  canvas.endDraw();

  //create fonts
  font1=createFont("x-files", 30);
  font2=createFont("x-files", 45);


  //upload data
  countbystate=loadStrings("Count_by_state.txt");
  descriptions=loadStrings("descriptions.txt");

  //initilaise the arraylist to hold states
  statelist=new ArrayList <State>();


  //use countbystate to get info for each state
  for (int i=0;i<countbystate.length;i++)
  {
    //split each row of the imported arrray into name, count, and colour in the canvas and make a new state
    String name_=splitTokens(countbystate[i], "\t")[0];
    String count_=splitTokens(countbystate[i], "\t")[1];
    String mapcolour_=splitTokens(countbystate[i], "\t")[2];
    String xpos_=splitTokens(countbystate[i], "\t")[3];
    String ypos_=splitTokens(countbystate[i], "\t")[4];
    statelist.add(new State(name_, int(count_), int(mapcolour_), float(xpos_), float(ypos_)));
  } 

  //use descriptions to add the description for each state
  for (int i=0;i<descriptions.length;i++)
  {
    String desc=splitTokens(descriptions[i], "\t")[1];
    statelist.get(i).description=desc;
  }

  //set datacolour 
  for (State s: statelist)
  {
    color tempcolour=color(0, int(map(s.count, 146, 9931, 30, 200)), 0);
    s.datacolour=tempcolour;
  }

  //initialise minim
  minim=new Minim(this);

  //upload music for each state
  statelist.get(0).addNarr(minim.loadFile("Alabama.mp3"));
  statelist.get(1).addNarr(minim.loadFile("Arkansas.mp3"));
  statelist.get(2).addNarr(minim.loadFile("Arizona.mp3"));
  statelist.get(3).addNarr(minim.loadFile("California.mp3"));
  statelist.get(4).addNarr(minim.loadFile("Colorado.mp3"));
  statelist.get(5).addNarr(minim.loadFile("Connecticut.mp3"));
  statelist.get(6).addNarr(minim.loadFile("Delaware.mp3"));
  statelist.get(7).addNarr(minim.loadFile("Florida.mp3"));
  statelist.get(8).addNarr(minim.loadFile("Georgia.mp3"));
  statelist.get(9).addNarr(minim.loadFile("Iowa.mp3"));
  statelist.get(10).addNarr(minim.loadFile("Idaho.mp3"));
  statelist.get(11).addNarr(minim.loadFile("Illinois.mp3"));
  statelist.get(12).addNarr(minim.loadFile("Indiana.mp3"));
  statelist.get(13).addNarr(minim.loadFile("Kansas.mp3"));
  statelist.get(14).addNarr(minim.loadFile("Kentucky.mp3"));
  statelist.get(15).addNarr(minim.loadFile("Louisiana.mp3"));
  statelist.get(16).addNarr(minim.loadFile("Massachusets.mp3"));
  statelist.get(17).addNarr(minim.loadFile("Maryland.mp3"));
  statelist.get(18).addNarr(minim.loadFile("Maine.mp3"));
  statelist.get(19).addNarr(minim.loadFile("Michigan.mp3"));
  statelist.get(20).addNarr(minim.loadFile("Minnesota.mp3"));
  statelist.get(21).addNarr(minim.loadFile("Missouri.mp3"));
  statelist.get(22).addNarr(minim.loadFile("Mississippi.mp3"));
  statelist.get(23).addNarr(minim.loadFile("Montana.mp3"));
  statelist.get(24).addNarr(minim.loadFile("North Carolina.mp3"));
  statelist.get(25).addNarr(minim.loadFile("North Dakota.mp3"));
  statelist.get(26).addNarr(minim.loadFile("Nebraska.mp3"));
  statelist.get(27).addNarr(minim.loadFile("New Hampshire.mp3"));
  statelist.get(28).addNarr(minim.loadFile("New Jersey.mp3"));
  statelist.get(29).addNarr(minim.loadFile("New Mexico.mp3"));
  statelist.get(30).addNarr(minim.loadFile("Nevada.mp3"));
  statelist.get(31).addNarr(minim.loadFile("New York.mp3"));
  statelist.get(32).addNarr(minim.loadFile("Ohio.mp3"));
  statelist.get(33).addNarr(minim.loadFile("Oklahoma.mp3"));
  statelist.get(34).addNarr(minim.loadFile("Oregon.mp3"));
  statelist.get(35).addNarr(minim.loadFile("Pennsylvania.mp3"));
  statelist.get(36).addNarr(minim.loadFile("Rhode Island.mp3"));
  statelist.get(37).addNarr(minim.loadFile("South Carolina.mp3"));
  statelist.get(38).addNarr(minim.loadFile("South Dakota.mp3"));
  statelist.get(39).addNarr(minim.loadFile("Tennessee.mp3"));
  statelist.get(40).addNarr(minim.loadFile("Texas.mp3"));
  statelist.get(41).addNarr(minim.loadFile("Utah.mp3"));
  statelist.get(42).addNarr(minim.loadFile("Virginia.mp3"));
  statelist.get(43).addNarr(minim.loadFile("Vermont.mp3"));
  statelist.get(44).addNarr(minim.loadFile("Washington.mp3"));
  statelist.get(45).addNarr(minim.loadFile("Wisconsin.mp3"));
  statelist.get(46).addNarr(minim.loadFile("West Virginia.mp3"));
  statelist.get(47).addNarr(minim.loadFile("Wyoming.mp3"));

  //deal with credits, titles and descriptions
  showtitles=true; //start by showing credits
  showcredits=false; //don't show credits until you click on 'em
  showdescription=false; //don't until you click on a state!


  //inititalise buttons
  titlesexit=new Button(width/2, height/2+150, 120, 70, color(0, 255, 0), "View Map");
  creditsexit=new Button(width/2, height/2, 100, 20, color(255, 255, 0), "View Map");
  descriptionexit=new Button(width/2, height/2, 100, 70, color(255, 255, 0), "Back");
  titlesshowbutton=new Button(0.05*width, 0.05*height, 100, 20, color(0, 0, 255), "Titles Screen");
  creditsshowbutton=new Button(0.75*width, 0.05*height, 100, 70, color(0, 0, 100), "Credits");

  /*//TEST
   for(State s: statelist)
   {
   println(s.name+" "+green(s.datacolour));
   }*/
}

/////////////////////////////////////////
void draw()

{
  loadPixels();


  //Set the background to be the US Map
  background(map);

  //change cursor if moves on the map
  if (canvas.get(mouseX, mouseY)!=0)
  {
    cursor(HAND);
  }
  else
  {
    cursor(ARROW);
  }


  //println(canvas.get(mouseX,mouseY));

  ///show the count floating 
  //Show the count when you hover
  for (State s: statelist)
  {
    if (canvas.pixels[mouseX+mouseY*width]==s.mapcolour && showcredits==false && showtitles==false)
    {
      s.showFlicker(20, 700);
    }
  }

  //buttons to show credits and titles
  //titlesshowbutton.displayButton();
  //creditsshowbutton.displayButton();

  //The Heading
  pushStyle();
  textAlign(CENTER);
  fill(255);
  textFont(font1);
  text("UFO Sightings in Mainland USA", width/2, 35);

  popStyle();

  //titles
  if (showtitles)
  {
    displayTitles();
  }

  //credits
  if (showcredits)
  {
    displayCredits();
  }

  //descpriptions and narratives
  if (showdescription)
  {
    //currentstate.narrative.rewind();
    displayDescription();
    int temp_m=millis();
    playNarrative();

    if (currentstate.narrative.length()<=millis()-temp_m) //to try and get rid of that buzzing
    {
      //currentstate.narrative.mute();
    }
  }
  else if (currentstate!=null) // turn if sounds if want to prematurely exit
  {
    currentstate.narrative.mute();
  }

  //update colours
  /*for (State s: statelist) 
   for (int i=0; i<canvas.pixels.length; i++)
   {
   if (canvas.pixels[i]== s.mapcolour && showcredits==false && showtitles==false)
   pixels[i]=s.datacolour;
   }*/

  //TEST PURPOSES
  //show x,y coordinates of where you are on-screen
  //println(mouseX + ","+ mouseY);
  //textFont(font1);
  //text(canvas.get(mouseX, mouseY), 50, 50);
  //text(mouseX+","+mouseY,mouseX,mouseY); //show mouse position, to find the center





  //updatePixels();
}

///////////////////////////////////////////////
///////////////////////////////////////////////
//////////////////////////////////////////////
//the white screen to show titles and credits
void displayTitleScreen()
{
  pushStyle();
  fill(0, 235);
  rect(0, 0, width, height);  //dynamic size
  popStyle();
}

///////////////////////////////////////////////
///////////////////////////////////////////////
///////////////////////////////////////////////
void displayTitles()
{
  displayTitleScreen();//show the title screen first, including associated buttons

  /*pushStyle();
   textFont(font1);
   fill(0);
   text("Title", width/2, 0.3*height);
   
   titlesexit.displayButton();
   popStyle();*/

  pushStyle();
  textFont(font2);
  textAlign(CENTER);
  fill(0, 200, 0);
  //ruse a random number for flicker
  float r_=random(10);
  if (r_<9)
    text("Unidentified \n by Sharang Biswas", width/2, height/2);

  /*textFont(font1);
   fill(0);
   text("Title", width/2, 0.3*height);
   */

  textFont(font1);
  fill(255);
  text("Press any key to continue", width/2, height/2+120);


  popStyle();
}

///////////////////////////////////////////////
///////////////////////////////////////////////
///////////////////////////////////////////////
void displayCredits() // show credits, including associated buttons
{
  displayTitleScreen();
  pushStyle();
  textFont(font1);
  fill(0);
  text("Credits", width/2, 0.3*height);


  textFont(font1);
  fill(255);
  text("Press any key to continue", width/2, height/2+120);
  popStyle();
}
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
void displayDescription()
{

  displayTitleScreen();
  pushStyle();
  textAlign(CENTER);
  fill(color(0, 255, 0));
  textFont(font1);
  text(currentstate.description, width/2, height/2);

  /* textFont(font1);
   fill(255);
   text("Press any key to continue", width/2, height/2+120);*/
  popStyle();
}

/////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
void playNarrative()
{

  currentstate.narrative.unmute();
  currentstate.narrative.play();
  //currentstate.narrative.pause();
}


////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////


void mousePressed()
{

  //button to show titles
  if (titlesshowbutton.isInside() && showtitles==false)
    showtitles=true;

  //button to show credits
  if (creditsshowbutton.isInside() && showcredits==false)
    showcredits=true;


  //click on a State. Show the description.
  if (showtitles==false && showcredits==false  && showdescription==false)
  {
    for (State s: statelist)
    {
      if (canvas.get(mouseX, mouseY)==s.mapcolour)
      {
        showdescription=true;
        currentstate=s;
        currentstate.narrative.rewind();
      }
    }
  } 
  //**************************************IMPTNT! This prevents the activation of a new state upon clicking on it to get rid of the description screen.
  else if (showdescription) {
    showdescription = false;
  }
}
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////

void keyPressed()
{
  /*//exit titles
   if (titlesexit.isInside() && showtitles==true) //if you're inside the button and the titles aren't showing
   {
   showtitles=false;
   delaytimer=second();
   }
   //if (showtitles==true)
   //showtitles=false;
   
   //exit button for credits
   if (showcredits==true)
   {
   showcredits=false;
   delaytimer2=second();
   }
   
   //exit description
   if (descriptionexit.isInside())
   showdescription=false;*/
   
  //exit titles
  if (showtitles==true) //if you're inside the button and the titles aren't showing
    showtitles=false;

  //exit button for credits
  if (showcredits==true)
    showcredits=false;

  //exit description
  if (showdescription=true)
    showdescription=false;


  //reload all the sound


  
}

////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
void stop() //closing minim and stuff
{
  for (State s:statelist)
    s.narrative.close();  
  minim.stop();
  super.stop();
}


/* ASK:
 
 
 
 for gradual motion:
 use "lerp" (John Farrell)
 
 
 add some motion to the map
 
 clouds or fog?
 
 Sounds + Music
 */
