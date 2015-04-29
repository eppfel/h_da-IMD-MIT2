class OwiKaefer1 extends Kaefer {
  
  float noiseP;
  PVector target;
  boolean hasTarget;
  int targetMemory;
  
  color obstacle;
  
  OwiKaefer1() {
 
     super();
     speed = random(0.5, 2.0);
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     noiseP = 0;
     
     target = new PVector(0, 0);
     hasTarget = false;
     targetMemory = 0;
     
     obstacle = color(0);
  }
  
  void draw() {
    
    // mouth position
    PVector mouth = new PVector(direction.x, direction.y);
    mouth.normalize();
    mouth.mult(10);
    mouth.add(position);

    
    // eat everything that is not black or white
    boolean eat = false;
    color test = map.get((int)mouth.x, (int)mouth.y);
      float red = test >> 16 & 0xFF;
      float green = test >> 8 & 0xFF;
      float blue = test & 0xFF;
    if(test==obstacle) {
      
      position.sub(direction);
      direction.rotate(PI/180.0*random(-180, 180));
      //direction.rotate(PI);
    } 
    else if(red<230 && green>50 && blue<230) eat = true;
    if(eat) {
      
      if(frameCount%5==0) {
        
        // eat a  pixels
        map.set((int)mouth.x, (int)mouth.y, color(255));
        hasTarget = false;
        // wobble around
        noiseP += 0.2;
        direction.rotate((noise(noiseP)-0.5)*0.5);
      }
    }
    
    // update position

    if(hasTarget) {
      
      // forget my target after 30 steps
      // maybe its not good anymore...
     targetMemory++; 
      if(targetMemory>30) hasTarget = false;
    }
    
    
    boolean foundATarget = hasTarget;
    if(!hasTarget) {
     
      foundATarget = searchSomethingGreen();
      if(foundATarget) {
        // theres something green ... go there
        PVector directionToTarget = new PVector(target.x, target.y);
        directionToTarget.sub(position);
        directionToTarget.normalize();
        directionToTarget.mult(speed);
        direction = directionToTarget;
      }
    }
    
    if(!foundATarget) {
      // no target ...just idle around
      noiseP += 0.02;
      direction.rotate((noise(noiseP)-0.5)*0.05);
    }
    
    
    if(!eat) position.add(direction);
    checkBorder();
    
    // draw kaefer
    fill(255);
    if(hasTarget) fill(220, 255, 220);
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

  
  boolean searchSomethingGreen() {
   
     boolean foundIt = false;
    
    // mouth position
    PVector mouth = new PVector(direction.x, direction.y);
    mouth.normalize();
    mouth.mult(10);
    mouth.add(position);
    
    // near range monte-carlo search
    int nearDistanceRange = 8; 
    int nearNumTests = 32;
    boolean foundGreenInNearRange = false;
    for(int i=0; i<nearNumTests; i++) {
      int r = nearDistanceRange;
      int searchX = (int)mouth.x +(int)random(-r, r);
      int searchY = (int)mouth.y +(int)random(-r, r);

      color test = map.get(searchX, searchY);
      float red = test >> 16 & 0xFF;
      float green = test >> 8 & 0xFF;
      float blue = test & 0xFF;
      
      if(red<230 && green>50 && blue<230) {
        
        foundIt = true;
        foundGreenInNearRange = true;
        hasTarget = true;
        target.set(searchX, searchY);
        targetMemory = 0;
      }
    }
    if(foundGreenInNearRange) return true;
    
    
    // check obstacles in front
    float checkDistance = 200;
    float checkSteps = 32;
    PVector checkDirection = new PVector(direction.x, direction.y);
    checkDirection.normalize();
    checkDirection.mult(checkDistance/checkSteps);
    boolean  obstacleInFront = false;
    PVector frontCheck = new PVector(mouth.x, mouth.y);
    for(int i=0; i<checkSteps; i++) {
      
      frontCheck.add(checkDirection);
      int searchX = (int)frontCheck.x;
      int searchY = (int)frontCheck.y;
      color test = map.get(searchX, searchY);
      if(test == obstacle) {
        hasTarget = false;
        return false;
      }
      float red = test >> 16 & 0xFF;
      float green = test >> 8 & 0xFF;
      float blue = test & 0xFF;
      if(red<230 && green>50 && blue<230) {
        
        foundIt = true;
        hasTarget = true;
        target.set(searchX, searchY);
        targetMemory = 0;
        return true;
      }
    }
    
    /*
    
    // near range monte-carlo search
    int nearDistanceRange = 8; 
    int nearNumTests = 32;
    boolean foundGreenInNearRange = false;
    for(int i=0; i<nearNumTests; i++) {
      int r = nearDistanceRange;
      int searchX = (int)mouth.x +(int)random(-r, r);
      int searchY = (int)mouth.y +(int)random(-r, r);

      color test = map.get(searchX, searchY);
      float red = test >> 16 & 0xFF;
      float green = test >> 8 & 0xFF;
      float blue = test & 0xFF;
      
      if(red<230 && green>50 && blue<230) {
        
        foundIt = true;
        foundGreenInNearRange = true;
        hasTarget = true;
        target.set(searchX, searchY);
        targetMemory = 0;
      }
    }
    if(foundGreenInNearRange) return true;
    
    // far range monte-carlo search
    int farDistanceRange = 50; 
    int farNumTests = 32;
    for(int i=0; i<farNumTests; i++) {
      int r = farDistanceRange;
      int searchX = (int)mouth.x +(int)random(-r, r);
      int searchY = (int)mouth.y +(int)random(-r, r);
      color test = map.get(searchX, searchY);
      float red = test >> 16 & 0xFF;
      float green = test >> 8 & 0xFF;
      float blue = test & 0xFF;
      if(red<230 && green>50 && blue<230) {
        
        foundIt = true;
        hasTarget = true;
        target.set(searchX, searchY);
        targetMemory = 0;
      }
    }
    */
    
    return foundIt;
  }
  
  
  void checkBorder() {
    
    if(position.x<0 || position.x>width) direction.x *= -1;
    if(position.y<0 || position.y>height) direction.y *= -1;
  }
}
