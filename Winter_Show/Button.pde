class Button //basic, rectangular (round coerner), coloured button
{
  //positions using a CENTER rectmode
  float xpos;
  float ypos;
  float len; //length
  float high; //width
  color clr;
  String text;

  Button(float x, float y, float l, float h, color c, String txt)
  {
    xpos=x;
    ypos=y;
    len=l;
    high=h;
    clr=c;
    text=txt;
  }

  void displayButton()
  {
    pushStyle();
    rectMode(CENTER);
    noFill();
    stroke(clr);
    strokeWeight(7);
    rect(xpos, ypos-10, len, high, 10);
    fill(255);
    textAlign(CENTER);
    textFont(font1);
    text(text,xpos,ypos);
    popStyle();
  }

  boolean isInside() //checks if MOUSE is in the button
  {
    return mouseX<xpos+len && mouseX>xpos-len && mouseY<ypos+high && mouseY>ypos-high;
  }
}

