class OwiKaefer1 extends Kaefer {
  
  OwiKaefer1() {
 
     super();
     speed = random(0.5, 2.0);
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
  }
  
  void draw() {

    // update position
    position.add(direction);
    checkBorder();
    
    // draw
    fill(255);
    ellipse(position.x, position.y, 20, 20);
    
    // mittellinie
    PVector m = new PVector(direction.x, direction.y);
    m.normalize();
    line(position.x-m.x*10,
    position.y-m.y*10, 
    position.x+m.x*10, 
    position.y+m.y*10
    );
    
    // fühler
    PVector f1 = new PVector(direction.x, direction.y);
    f1.normalize();
    f1.rotate(-0.5);
    line(position.x+f1.x*10,
    position.y+f1.y*10, 
    position.x+f1.x*20, 
    position.y+f1.y*20
    );
    f1.rotate(1);
    line(position.x+f1.x*10,
    position.y+f1.y*10, 
    position.x+f1.x*20, 
    position.y+f1.y*20
    );
  }
  
  void checkBorder() {
    
    if(position.x<0 || position.x>width) direction.x *= -1;
    if(position.y<0 || position.y>height) direction.y *= -1;
  }
}
