class Wire {
  
  PImage[] backgrounds;
  int frame;
  
 Wire() {
    frame = 0;
    backgrounds = new PImage[3];
    for (int i = 0; i < 3; i++) {
        backgrounds[i] = loadImage("wire_" + (i+1) + ".png");
     }
 } 
  
  void draw() {
    frame = (frame+1) % 3;
    image(backgrounds[frame], 0, 0);
  }
  
}
