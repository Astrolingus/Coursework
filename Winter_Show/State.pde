class State
{
  String name; //name of the state
  float xpos; // the abscissa of the centre
  float ypos; //the ordinate of the centre
  int count; //the total number of UFO sightings in the state
  color mapcolour; //the color of the underlying, invisible map, for selection purposes
  color datacolour; //the color of the map using the data
  String description;
  AudioPlayer narrative;

  State (String n, int c, int cl, float x, float y)
  {
    name=n;
    xpos=x;
    ypos=y;
    count=c;
    mapcolour=cl;
    datacolour=0;
    description="";
  }

  //Add the narrative voice
  void addNarr(AudioPlayer ap)
  {
    narrative=ap;
  }

  //causes the count to appear on screen, flickering
  void showFlicker(float x, float y)
  { 
    pushStyle();
    textFont(font2);
    fill(255);

    String countstr=String.valueOf(count); //convert the count to a string first

      //flicker only happens sometimes, so check that
    float temp1=random(10);
    float temp2=random(10);

    if (temp1<9)  
      text(countstr+" UFO SIGHTINGS", x, y);


    if (temp2<9)
      text(name+":", x, y-40);

    popStyle();
  }

  /*void displayDescription()
   {
   
   displayTitleScreen();
   pushStyle();
   textAlign(CENTER);
   fill(255);
   textFont(font2);
   text(description, width/2, 0.05*height);
   popStyle();
   }*/
}

