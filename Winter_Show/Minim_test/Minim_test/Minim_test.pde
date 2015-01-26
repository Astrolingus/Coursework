import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
 
void setup()
{
  size(100, 100);
 
  minim = new Minim(this);
 
  // this loads mysong.wav from the data folder
  song = minim.loadFile("California.mp3");
  song.play();
}
 
void draw()
{
  background(0);
}
