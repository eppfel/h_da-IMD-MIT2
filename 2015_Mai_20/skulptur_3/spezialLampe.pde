// KLAUSUR - inherit
class spezialLampe extends lampe {
  
  spezialLampe(int x, int y, int z) {
    // KLAUSUR - super
   super(x, y, z); 
  }
  
  // KLAUSUR - function overload
  void show() {
    super.show();
    stroke(0, 255, 0);
    pushMatrix();
    translate(positionX, positionY, positionZ);
    textSize(100);
    text("TEST", 0, 0);
    popMatrix();
  }
}
