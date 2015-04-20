ArrayList<Kaefer> liste = new ArrayList<Kaefer>();

void setup() {

  size(displayWidth, displayHeight, P2D);

int mult = 1; // try 40 ... = 880 kaefer (runs with 30fps on newer iMac) 

for(int i=0; i<mult; i++) {

  // owi kaefer
  liste.add(new OwiKaefer1());
  liste.add(new OwiKaefer2());
  liste.add(new Wanze1());

  // studenten kaefer
  liste.add( new marienkaefer());
  liste.add( new OwiKaefer3());
  liste.add( new VanessaKaefer());
  liste.add( new mykaefer());
  liste.add( new MaxKaefer());
  liste.add( new NinaKaefer());
  liste.add( new Biene());
  liste.add( new meinKaefer1());
  liste.add( new Kaefer2());
  liste.add( new dgKaefer());
  liste.add( new NadjaKaefer());
  liste.add( new LisaKaefer());
  liste.add( new CarolinKaefer());
  liste.add( new NatKaefer());
  liste.add( new DaviKaefer());
  liste.add( new IsabelKaefer());
  liste.add( new OwiKaeferNeumayr());
  liste.add( new CelineKaefer());
  liste.add( new RominaKaefer2());
}

}

void draw() {

  background(255);
  for (Kaefer k : liste) k.draw();
  fill(0, 102, 153);
  text("fps: " + frameRate, 10, 30);
  text("kaefer: " + liste.size(), 10, 50);
}

boolean sketchFullScreen() {
  return true;
}

