class OwiKaefer2 extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  OwiKaefer2() {
 
     super();
     speed = 2.0;
     noiseP = 0;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 16;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into five digits
      String filename = "kaefer_" + nf(i, 5) + ".png";
      images[i] = loadImage(filename);
    }
  }
  
  void draw() {

    // update position
    frame = (frame+1) % imageCount;
    noiseP += 0.02;
    direction.rotate((noise(noiseP)-0.5)*0.05);
    position.add(direction);
    checkBorder();
    
    PVector up = new PVector(0, -1);
    float rotation = angle(up, direction);
    
    // draw
    fill(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation);
    image(images[frame], -images[frame].width/2, -images[frame].height/2);
    popMatrix();
    
  }
  
  void checkBorder() {
    
    if(position.x<0 || position.x>width) direction.x *= -1;
    if(position.y<0 || position.y>height) direction.y *= -1;
  }
  
  float angle(PVector v1, PVector v2) {
    float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
    if (a < 0) a += TWO_PI;
    return a;
  }
}
