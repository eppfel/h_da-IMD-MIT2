
Wetter wetterJahr;
myClass myObject;
PImage aufgabe, echt;
float jahresverlauf;
String monate[];

void setup() {
  size(900, 600);
  
  wetterJahr = new Wetter();
  myObject = new myClass();
  aufgabe = loadImage("task.png");
  echt = loadImage("echt.png");
  jahresverlauf = 0;
  monate = new String[]{"Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"};
}

void draw() {

  background(255);
  
  jahresverlauf += 0.0002;
  if(jahresverlauf>1) jahresverlauf-=1;
  
  image(aufgabe, 100, 250);
  image(echt, 500, 50);
  zeigeUhr();
  zeigeDaten();
  
  myObject.draw();
 
}

void zeigeUhr() {
  // Jahresuhr
  PVector center = new PVector(160, 140);
  float radius = 120;
  stroke(0); fill(255);
  ellipse(center.x, center.y, radius, radius);
  
   PVector linie = new PVector(0, -radius*2/6-4);
   PVector stueck = new PVector(0, -radius*1/6+8);
   fill(0);
   for(int i=0; i<12; i++) {
     linie.rotate(TWO_PI/12);
     stueck.rotate(TWO_PI/12);
     line(center.x+linie.x, center.y+linie.y, center.x+linie.x+stueck.x, center.y+linie.y+stueck.y); 
     if(i==0) textAlign(LEFT, BOTTOM);
     if(i==1) textAlign(LEFT, CENTER);
     if(i==2) textAlign(LEFT, CENTER);
     if(i==3) textAlign(LEFT, CENTER);
     if(i==4) textAlign(LEFT, TOP);
     if(i==5) textAlign(CENTER, TOP);
     if(i==6) textAlign(RIGHT, TOP);
     if(i==7) textAlign(RIGHT, CENTER);
     if(i==8) textAlign(RIGHT, CENTER);
     if(i==9) textAlign(RIGHT, CENTER  );
     if(i==10) textAlign(RIGHT, BOTTOM);
     if(i==11) textAlign(CENTER, BOTTOM);
     text(monate[i], center.x+linie.x+stueck.x*3, center.y+linie.y+stueck.y*3);
   }
 
  PVector zeiger = new PVector(0, -radius*2/6);
  zeiger.rotate(TWO_PI*jahresverlauf+TWO_PI/12);
  line(center.x, center.y, center.x+zeiger.x, center.y+zeiger.y);
}

void zeigeDaten() {
  
  float temp = wetterJahr.getTemperatur(jahresverlauf);
  float feucht = wetterJahr.getLuftfeuchte(jahresverlauf);
  float nieder = wetterJahr.getNiederschlag(jahresverlauf);
  float sonne = wetterJahr.getSonnenschein(jahresverlauf) / 30;
  float schnee = wetterJahr.getSchneehoehe(jahresverlauf);
  String pStr = "Temperatur " + nfp(temp, 1, 1)+ " °C\n\n";
  pStr += "Luftfeuchtigkeit " + round(feucht)+ " %\n\n";
  pStr += "Niederschlag " + nf(nieder,1,1)+ " l/m2\n\n";
  pStr += "Sonnenschein " + nf(sonne,1,1)+ " h/tag\n\n";
  pStr += "Schneehöhe " + round(schnee)+ " cm";
  fill(0);
  textAlign(LEFT, BOTTOM);
  text(pStr, 350, 180);
}

