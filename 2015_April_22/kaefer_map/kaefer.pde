class Kaefer {
  
  PVector position;
  PVector direction;
  float speed;
  
  Kaefer() {
    
    position = new PVector(random(width), random(height));
    direction = new PVector(0, 1);
    speed = 0;
  }
  
  void draw() {

    fill(100);
    ellipse(position.x, position.y, 20, 20);
  }
  
}
