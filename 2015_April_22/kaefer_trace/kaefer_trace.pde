ArrayList<Kaefer> liste = new ArrayList<Kaefer>();

void setup() {

  size(1600, 900, P2D);
  for(int i=0; i<10; i++) liste.add(new OwiKaefer1());

}

void draw() {

  background(255);
  for (Kaefer k : liste) k.draw();
  fill(0);
  text("fps: " + frameRate, 10, 30);
  text("kaefer: " + liste.size(), 10, 50);
}

boolean sketchFullScreen() {
  return false;
}

