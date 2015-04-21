class OwiKaefer1 extends Kaefer {
  
  ArrayList<PVector> history;
  int history_length;
  float noiseP;
  
  OwiKaefer1() {
 
     super();
     speed = random(0.5, 2.0);
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     noiseP = 0;
     
     history = new ArrayList<PVector>();
     history_length = 100;
  }
  
  void draw() {

    // update history
    if(frameCount%5 == 0) {
      history.add(new PVector(position.x, position.y));
      if(history.size()>history_length) history.remove(0);
    }
    // update position
    noiseP += 0.02;
    direction.rotate((noise(noiseP)-0.5)*0.05);
    
    position.add(direction);
    checkBorder();
    
    // draw history
    for (PVector punkt : history) {
     
      fill(0);
      ellipse(punkt.x, punkt.y, 1, 1);
    }
    
    // draw kaefer
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
