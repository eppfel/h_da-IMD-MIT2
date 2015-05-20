class lampe {
  
  float positionX, positionY, positionZ;
  float baseX, baseY, baseZ;
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
   baseX = x; baseY = y; baseZ = z;
   radius = 20;
   seilLaenge = 500;
   animator = 0;
 }
  void show() {
    // animate
    animator += 0.01;
    float animator2 = animator*0.5;
    float k = 0.001;
    float animY = noise(animator+baseX*k, baseY*k, animator2+baseZ*k) *seilLaenge;
    pushMatrix();
    translate(positionX, positionY-animY, positionZ);
    sphere(radius);
    stroke(255, 0, 0);
    line(0, 0, 0, 0, -(seilLaenge-animY), 0);
    noStroke();
    popMatrix();
  }
}
