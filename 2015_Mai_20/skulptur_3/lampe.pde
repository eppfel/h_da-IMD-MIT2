class lampe {
  
  float positionX, positionY, positionZ;
  float radius;
  float seilLaenge;
  float animator;
  // KLAUSUR - multiple constructors
 lampe() { 
  
   positionX = positionY = positionZ = 0;
   radius = 20;
   animator = 0;
 }
 lampe(float x, float y, float z) { 
  
   positionX = x; positionY = y; positionZ = z;
   radius = 20;
   seilLaenge = 500;
   animator = 0;
 }
  void show() {
    // animate
    animator += 0.01;
    float k = 0.001;
    float animY = noise(animator*positionX*k, positionY*k, animator*positionZ*k) *seilLaenge;
    pushMatrix();
    translate(positionX, positionY-animY, positionZ);
    sphere(radius);
    stroke(255, 0, 0);
    line(0, 0, 0, 0, -(seilLaenge-animY), 0);
    noStroke();
    popMatrix();
  }
}
