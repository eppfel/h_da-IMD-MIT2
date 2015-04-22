class FabioMathesKaefer extends Kaefer {

  PImage[] images;
int imageCount;
int frame;
float noiseP;
  
FabioMathesKaefer() {
 
     super();
     speed = 2.0;
     noiseP = 0;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 16;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      String filename = "FM_kaefer.png";
      images[i] = loadImage(filename);
    }
  }
  
  void draw() {

    // update position
    frame = (frame+1) % imageCount;
    noiseP += 0.02;
    direction.rotate((noise(noiseP)-0.5)*0.05);
    position.add(direction);
    checkBorder();
    
    PVector up = new PVector(0, -1);
    float rotation = angle(up, direction);
    
    // draw
    fill(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation);
    image(images[frame], -images[frame].width/2, -images[frame].height/2);
    popMatrix();
    
  }
  
  void checkBorder() {
    
    if(position.x<0 || position.x>width) direction.x *= -1;
    if(position.y<0 || position.y>height) direction.y *= -1;
  }
  
  float angle(PVector v1, PVector v2) {
    float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
    if (a < 0) a += TWO_PI;
    return a;
  }
}

class MariaKaefer extends Kaefer {
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;

  MariaKaefer() {
    super();
    speed = random(0.5, 2.0);
    noiseP = 0;
    direction.rotate(random(TWO_PI));
    direction.mult(speed);

    imageCount = 1;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);

    for (int i = 0; i < imageCount; i++) {
      String filename = "butterfly.png";
      images[i] = loadImage(filename);
    }
  }
  void draw() {
    // update position
    frame = (frame+1) % imageCount;
    noiseP += 0.02;
    direction.rotate((noise(noiseP)-0.5)*0.05);
    position.add(direction);
    checkBorder();

    PVector up = new PVector(0, -1);
    float rotation = angle(up, direction);

    // draw
    fill(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation);
    image(images[frame], -images[frame].width/2, -images[frame].height/2);
    popMatrix();
  }

  void checkBorder() {

    if (position.x<0 || position.x>width) direction.x *= -1;
    if (position.y<0 || position.y>height) direction.y *= -1;
  }

  float angle(PVector v1, PVector v2) {
    float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
    if (a < 0) a += TWO_PI;
    return a;
  }
}

class MariasKaefer extends Kaefer {
  PImage[] images;
int imageCount;
int frame;
float noiseP;

MariasKaefer() {

super();
speed = 2.0;
noiseP = 0;
direction.rotate(random(TWO_PI));
direction.mult(speed);

imageCount = 1;
images = new PImage[imageCount];
frame = (int) random(imageCount);

for (int i = 0; i < imageCount; i++) {
// Use nf() to number format 'i' into five digits
String filename = "MariaKaefer.png";
images[i] = loadImage(filename);
}
}

void draw() {

// update position
frame = (frame+1) % imageCount;
noiseP += 0.02;
direction.rotate((noise(noiseP)-0.5)*0.05);
position.add(direction);
checkBorder();

PVector up = new PVector(0, -1);
float rotation = angle(up, direction);

// draw
fill(255);
pushMatrix();
translate(position.x, position.y);
rotate(rotation);
image(images[frame], -images[frame].width/2, -images[frame].height/2);
popMatrix();

}

void checkBorder() {

if(position.x<0 || position.x>width) direction.x *= -1;
if(position.y<0 || position.y>height) direction.y *= -1;
}

float angle(PVector v1, PVector v2) {
float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
if (a < 0) a += TWO_PI;
return a;
}
}

class TraceKaefer extends Kaefer {
  
  ArrayList<PVector> history;
  int history_length;
  float noiseP;
  
  TraceKaefer() {
 
     super();
     speed = random(0.5, 2.0);
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     noiseP = 0;
     
     history = new ArrayList<PVector>();
     history_length = 200;
  }
  
  void draw() {

    // update history
    if(frameCount%5 == 0) {
      history.add(new PVector(position.x, position.y));
      if(history.size()>history_length) history.remove(0);
    }
    // update position
    noiseP += 0.02;
    direction.rotate((noise(noiseP)-0.5)*0.05);
    
    position.add(direction);
    checkBorder();
    
    // draw history
    for (PVector punkt : history) {
     
      fill(0);
      ellipse(punkt.x, punkt.y, 1, 1);
    }
    
    // draw kaefer
    fill(255);
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
  
  void checkBorder() {
    
    if(position.x<0 || position.x>width) direction.x *= -1;
    if(position.y<0 || position.y>height) direction.y *= -1;
  }
}

class LuluKaeferKakuna extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  LuluKaeferKakuna() {
 
     super();
     speed = 2.0;
     noiseP = 0;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 1;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into five digits
      String filename = "Kakuna.png";
      images[i] = loadImage(filename);
    }
  }
  
  void draw() {

    // update position
    frame = (frame+1) % imageCount;
    noiseP += 0.02;
    direction.rotate((noise(noiseP)-0.5)*0.05);
    position.add(direction);
    checkBorder();
    
    PVector up = new PVector(0, -1);
    float rotation = angle(up, direction);
    
    // draw
    fill(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation);
    image(images[frame], -images[frame].width/2, -images[frame].height/2);
    popMatrix();
    
  }
  
  void checkBorder() {
    
    if(position.x<0 || position.x>width) direction.x *= -1;
    if(position.y<0 || position.y>height) direction.y *= -1;
  }
  
  float angle(PVector v1, PVector v2) {
    float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
    if (a < 0) a += TWO_PI;
    return a;
  }
}

class AnjaKaefer extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  AnjaKaefer() {
 
     super();
     speed = 2.0;
     noiseP = 0;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 1;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into five digits
      String filename = "marienkaefer2.png";
      images[i] = loadImage(filename);
    }
  }
  
  void draw() {

    // update position
    frame = (frame+1) % imageCount;
    noiseP += 0.02;
    direction.rotate((noise(noiseP)-0.5)*0.05);
    position.add(direction);
    checkBorder();
    
    PVector up = new PVector(0, -1);
    float rotation = angle(up, direction);
    
    // draw
    fill(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation);
    image(images[frame], -images[frame].width/2, -images[frame].height/2);
    popMatrix();
    
  }
  
  void checkBorder() {
    
    if(position.x<0 || position.x>width) direction.x *= -1;
    if(position.y<0 || position.y>height) direction.y *= -1;
  }
  
  float angle(PVector v1, PVector v2) {
    float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
    if (a < 0) a += TWO_PI;
    return a;
  }
}

class Ilkaefer extends Kaefer{
int x, y, w, h;
int speedBallX;       //Integer für die Geschwindigkeit des Balls auf X Achse
int speedBallY;       //Integer für die Geschwindigkeit des Balls auf X Achse

  Ilkaefer(){
    super();
//void setup () {
  
// size (800,500);
  x = width/2;           //X Position
  y = height /2;         //Y Postion
  w = 50;                //Breite
  h = 50;                //Höhe
  speedBallX = 1;   // Geschwindigkeit für den Ball ( "x" erhöht sich um einen bestimmten Wert)
  speedBallY = 1;
  
}

void draw() {
 
//  background(255); //Zeichnet zuerst (!) den Hintergrund ->60 FPS (Daddurch erscheint der Ball als einzelnes Element, weil der Hintegrund auch immer wieder neu proj. wird)
  drawKaefer();   // Der Code Void drawball wird ausgeführt (steht weiter unten, wird aber hier zuerst ausgef.)
  Ballspeed();    // Code weiter unten
  Ballreaction();  // Code weiter unten

}
void drawKaefer (){
   noStroke();
   fill(255,0,0);
  ellipse (x,y,w,h);  //Der Ball, Position Zentriert, Größe 50x50Pixel
  stroke(2);
  fill(255);
  ellipse(x+6,y-16,15,28);     //puppile
  ellipse(x-2,y-16,15,28);   //Pupille
  stroke(0);
  fill(0);
  ellipse(x+8,y-14,5,5);   //pupille2 groß
  ellipse(x-2,y-14,5,5);    //pupille2 groß
 // Weiße Flecken
  fill(255);
  ellipse(x,y+4,5,5);      
  ellipse(x-6,y+7,5,5);
  ellipse(x-5,y+13,5,5);
  ellipse(x-13,y+4,5,5);
  ellipse(x+15,y+3,5,5);
  ellipse(x+12,y+9,5,5);
  ellipse(position.x+8,position.y+17,5,5);
  // Fühler und füße
  stroke(0);
  line(x-14,y-16,x-20,y-27); // linker Fühler
  line(x+14,y-16,x+20,y-27);  // rechter Fühler
  line(x+20,y+18,x+15,y+12); // rechter Fuß
  line(x-20,y+18,x-15,y+12); // linker Fuß
}



void Ballreaction() {
//Was passiert wenn sich der Ball in eine bestimmte Richtunt bewegt:

  if  (x > width - w/2) {      //Sobald x (sich erhöht) die breite des Fensters erreicht... (-w/2 um NICHT den Mittelpunkt,sondern den Rand des Balls apprallen zu lassen
      speedBallX = -speedBallX;       // Wird der Ball in die entgegensätzte Richtung bewegt
      
        
}
  else if (x < + w/2) {    // Wenn x weniger als 0 auf dem Koord.syst. ist (Die linke seite des Bilds)
       speedBallX = -speedBallX;      //  Wird der Ball wieder nach Rechts bewegt
       
}
 
  if      (y > height - h/2) {     //Sobald die max höhe erreicht wird ..   (h/2 um nicht den Mittelpunkt sondern den Rand apprallen zu lassen)
    speedBallY = -speedBallY;            //-> Ball in entgegengesetzte Richtung bwg
     
}
  else if (y < + h/2) {     //Sobald y weniger als 0 erreicht ist..
    speedBallY = -speedBallY;            //-> Ball in entgegengesetzte Richtung bwg
    
}
}

void Ballspeed(){
x= x + speedBallX;   //X wert des Balls wird auf der X Achse erhöht  
y= y + speedBallY;   //Y Wert des Balls wird auf der Y Achse erhöht
}
}

class neuerKaefer extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  neuerKaefer() {
 
     super();
     speed = 3.0;
     noiseP = 10;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 1;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into five digits
      String filename = "neuerKaefer.gif";
      images[i] = loadImage(filename);
    }
  }
  
  void draw() {

    // update position
    frame = (frame+1) % imageCount;
    noiseP += 0.02;
    direction.rotate((noise(noiseP*2)-0.5)*0.1);
    position.add(direction);
    checkBorder();
    
    PVector up = new PVector(-1, 0);
    float rotation = angle(up, direction);
    
    // draw
    fill(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation);
    image(images[frame], -images[frame].width/2, -images[frame].height/2);
    popMatrix();
    
  }
  
  void checkBorder() {
    
    if(position.x<0 || position.x>width) direction.x *= -1;
    if(position.y<0 || position.y>height) direction.y *= -1;
  }
  
  float angle(PVector v1, PVector v2) {
    float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
    if (a < 0) a += TWO_PI;
    return a;
  }
}

class HongkiFly extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  HongkiFly() {
 
     super();
     speed = 2.0;
     noiseP = 0;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 2;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into five digits
      String filename = "fly" + nf(i, 2) + ".png";
      images[i] = loadImage(filename);
    }
  }
  
  void draw() {

    // update position
    frame = (frame+1) % imageCount;
    noiseP += 0.02;
    direction.rotate((noise(noiseP)-0.5)*0.05);
    position.add(direction);
    checkBorder();
    
    PVector up = new PVector(0, -1);
    float rotation = angle(up, direction);
    
    // draw
    fill(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation);
    image(images[frame], -images[frame].width/2, -images[frame].height/2);
    popMatrix();
    
  }
  
  void checkBorder() {
    
    if(position.x<0 || position.x>width) direction.x *= -1;
    if(position.y<0 || position.y>height) direction.y *= -1;
  }
  
  float angle(PVector v1, PVector v2) {
    float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
    if (a < 0) a += TWO_PI;
    return a;
  }

}

class SimoneKaefer extends Kaefer {
  
  SimoneKaefer() {
 
     super();
     speed = random(1.0, 2.0);
     direction.rotate(random(HALF_PI));
     direction.mult(speed);
  }
  
  void draw() {

    // update position
    position.add(direction);
    checkBorder();
    
    // draw
    noStroke();
    fill(255,0,0);
    ellipse(position.x, position.y, 20, 20);
    fill(0,0,0);
    ellipse(position.x-5 , position.y-5, 5, 5);
    ellipse(position.x+5, position.y+5, 5, 5);
    ellipse(position.x+5 , position.y-5, 5, 5);
    ellipse(position.x-5, position.y+5, 5, 5);
    
    // mittellinie
    stroke(2);
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
  
  void checkBorder() {
    
    if(position.x<0 || position.x>width) direction.x *= -1;
    if(position.y<0 || position.y>height) direction.y *= -1;
  }
}



class kaefer3 extends Kaefer {

int counter;
float moveLegs;
float noiseKaefer3;

  void draw() {

    position.add(direction);
    checkBorder();

    direction.rotate((noise(noiseKaefer3)-0.5)*0.05);

    PVector m = new PVector(direction.x, direction.y);
    m.normalize();
    
    fill(#5F320E);
    ellipse(position.x-m.x*10, position.y-m.x*10, 30, 40); // Körper
    ellipse(position.x-m.x*10, position.y+20-m.x*10, 20, 20); // Kopf

    strokeWeight(3);
    stroke(#5F320E);
    counter++;
    moveLegs = 1+ 5*sin(counter*0.3);

    for (int beine = 0; beine <20; beine+=9) {
      // Seite rechts
      line(position.x-m.x*10, position.y-10+beine-m.x*10, position.x+25-m.x*10, position.y-10+beine+moveLegs-m.x*10);
      line(position.x+30-m.x*10, position.y-15+beine+moveLegs-m.x*10, position.x+25-m.x*10, position.y-10+beine+moveLegs-m.x*10); 
      // Seite links
      line(position.x-25-m.x*10, position.y-10+beine+moveLegs-m.x*10, position.x-m.x*10, position.y-10+beine-m.x*10);
      line(position.x-30-m.x*10, position.y-15+beine+moveLegs-m.x*10, position.x-25-m.x*10, position.y-10+beine+moveLegs-m.x*10);
    }

    //fuehler
    line(position.x-m.x*10, position.y+20-m.x*10, position.x+20+moveLegs/2-m.x*10, position.y+40-m.x*10);
    line(position.x-m.x*10, position.y+20-m.x*10, position.x-20-moveLegs/2-m.x*10, position.y+40-m.x*10);
  }

  void checkBorder() {

    if (position.x<0 || position.x>width) direction.x *= -1;
    if (position.y<0 || position.y>height) direction.y *= -1;
  }
  float angle(PVector v1, PVector v2) {
    float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
    if (a < 0) a += TWO_PI;
    return a;
  }
}

class oenderkaefer extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  oenderkaefer() {
 
     super();
     speed = 2.0;
     noiseP = 0;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 1;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into five digits
      String filename = "uglyBug.png";
      images[i] = loadImage(filename);
    }
  }
  
  void draw() {

    // update position
    frame = (frame+1) % imageCount;
    noiseP += 0.02;
    direction.rotate((noise(noiseP)-0.5)*0.05);
    position.add(direction);
    checkBorder();
    
    PVector up = new PVector(0, -1);
    float rotation = angle(up, direction);
    
    // draw
    fill(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation);
    image(images[frame], -images[frame].width/2, -images[frame].height/2);
    popMatrix();
    
  }
  
  void checkBorder() {
    
    if(position.x<0 || position.x>width) direction.x *= -1;
    if(position.y<0 || position.y>height) direction.y *= -1;
  }
  
  float angle(PVector v1, PVector v2) {
    float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
    if (a < 0) a += TWO_PI;
    return a;
  }
}
