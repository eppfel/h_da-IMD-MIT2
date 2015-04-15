ArrayList<Kaefer> liste = new ArrayList<Kaefer>();

void setup() {
 
  size(1920, 1080);
  
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
}

void draw() {
  
  background(255);
  for (Kaefer k : liste) k.draw();
}

