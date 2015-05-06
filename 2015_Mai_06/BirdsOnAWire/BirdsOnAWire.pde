Wire Kabel;
Bird Vogel1;
Bird Vogel2;
Bird Vogel3;

void setup() { 
  size(1000, 700, P2D);
  frameRate(12);
  Kabel = new Wire();
  Vogel1 = new Bird(new PVector(200, 150), 0);
  Vogel1.name = "Philipp";
  Vogel2 = new Bird(new PVector(400, 160), 1);
  Vogel3 = new Bird(new PVector(600, 120), 2);
}

boolean sketchFullScreen() {
  return true;
}

void draw() { 
  Kabel.draw();
  Vogel1.draw();
  Vogel2.draw();
  Vogel3.draw();
}

void mousePressed() { 
  Vogel1.tap(mouseX, mouseY);
  Vogel2.tap(mouseX, mouseY);
  Vogel3.tap(mouseX, mouseY);
}
void mouseReleased() { 
  Vogel1.release();
  Vogel2.release();
  Vogel3.release();
}

