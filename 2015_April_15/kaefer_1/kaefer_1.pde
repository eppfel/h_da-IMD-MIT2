ArrayList<Kaefer> liste = new ArrayList<Kaefer>();

void setup() {


  size(displayWidth, displayHeight, P2D);

int mult = 1; // try 40 ... = 880 kaefer (runs with 30fps on newer iMac) 

for(int i=0; i<mult; i++) {

  // owi kaefer
  //liste.add(new OwiKaefer1());
  //liste.add(new OwiKaefer2());
  //liste.add(new Wanze1());
  //liste.add(new TraceKaefer());
  
  // studenten kaefer
  liste.add( new oenderkaefer());
  liste.add( new MariaKaefer());
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
  liste.add( new MariasKaefer());
  liste.add( new FabioMathesKaefer());
  liste.add( new LuluKaeferKakuna());
  liste.add( new AnjaKaefer());
  liste.add( new Ilkaefer());
  liste.add( new neuerKaefer());
  liste.add( new HongkiFly());
  liste.add( new SimoneKaefer());
  liste.add( new kaefer3());
  
 
}

}

void draw() {

  background(255);
  for (Kaefer k : liste) k.draw();
  fill(0, 102, 153);
  textSize(48);
  text("fps: " + (int)frameRate, 20, 80);
  text("kaefer: " + liste.size(), 20, 140);
}

boolean sketchFullScreen() {
  return true;
}

