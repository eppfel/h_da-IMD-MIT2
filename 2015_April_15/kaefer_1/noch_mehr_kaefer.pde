 

 
class marienkaefer extends Kaefer {

PImage[] images;
int imageCount;
int frame;
float noiseP;

marienkaefer() {

super();
speed = 2.0;
noiseP = 0;
direction.rotate(random(TWO_PI));
direction.mult(speed);

imageCount = 16;
images = new PImage[imageCount];
frame = (int) random(imageCount);

for (int i = 0; i < imageCount; i++) {
// Use nf() to number format 'i' into five digits
String filename = "marienkaefer.png";
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

class OwiKaefer3 extends Kaefer {
 
   PImage img; 
    float t = 0.;
    int x = 0;
  OwiKaefer3() {
    img = loadImage("Dementia-GTA2.png");
  }
 


  void draw() {
    //background(255);
    float x = map(noise(t), 0., 1., 0., width);
    //rect(x, 10, 20, 80);
    image(img, x, height/2);
    t = t+0.01;
  }
}

class VanessaKaefer extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  VanessaKaefer() {
 
     super();
     speed = 2.0;
     noiseP = 0;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 16;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into five digits
      String filename = "268.png";
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

PImage img3;
PImage img4;
PImage img5;
PImage img6;
float posX;
float posY;
int blick;
int d;
class mykaefer extends Kaefer {

mykaefer() {
img3=loadImage("Marienkäfer.png");
img4=loadImage("Marienkäfer2.png");
img5=loadImage("Marienkäfer3.png");
img6=loadImage("Marienkäfer4.png"); 
posX=width/2;
posY=height/2;
d=20;
}

void draw() {


float b =random(0,100);
blick=(int) random(4);
//Blickrichtung
switch(blick) {
case 0:
image(img5, posX, posY, d*1.5, d*1.5); 
for(int i=0;i<b;i++){posX=posX-0.1;}
break;
case 1:
image(img3, posX, posY, d*1.5, d*1.5); 
for(int i=0;i<b;i++){posX=posX+0.1;}
break;
case 2:
image(img6, posX, posY, d*1.5, d*1.5); 
for(int i=0;i<b;i++){posY=posY-0.1;} 
break;
case 3:
image(img4, posX, posY, d*1.5, d*1.5); 
for(int i=0;i<b;i++){posY=posY+0.1;}
break;
}

checkBorder();



}
void checkBorder() {

if(posX<0 || posX>width) blick=3;
if(posY<0 || posY>height) blick=1;
}

}

class MaxKaefer extends Kaefer {

  int iSize;
  PVector sinus;
  int timer;


 MaxKaefer() {

    super();
    speed = random(0.5, 2.0);
    direction.rotate(random(TWO_PI));
    direction.mult(speed);
    iSize = (int)random(15,35);
    timer = 0;
    sinus = new PVector( 0, sin(timer), 0 );

 }

 void draw() {

   // update sin
   timer++;
   sinus.y = 2* sin(timer/10);

   // update position
   position.add(direction);
   position.add(sinus);
   checkBorder();

   // draw
   fill(0,128,255);
   ellipse(position.x, position.y, iSize, iSize);

   // mittellinie
   PVector m = new PVector(direction.x, direction.y);
   m.normalize();
   line(
     position.x-m.x*(iSize/2),
      position.y-m.y*(iSize/2), 
      position.x+m.x*(iSize/2), 
      position.y+m.y*(iSize/2)
   );

   // fühler
   PVector f1 = new PVector(direction.x, direction.y);
   f1.normalize();
   f1.rotate(-0.5);
   line(
     position.x+f1.x*(iSize/2),
      position.y+f1.y*(iSize/2), 
      position.x+f1.x*iSize, 
      position.y+f1.y*iSize
   );
   f1.rotate(1);
   line(
     position.x+f1.x*(iSize/2),
      position.y+f1.y*(iSize/2), 
      position.x+f1.x*iSize, 
      position.y+f1.y*iSize
   );
 }

 void checkBorder() {

   if(position.x<0 || position.x>width) direction.x *= -1;
   if(position.y<0 || position.y>height) direction.y *= -1;

 }
}

class NinaKaefer extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  NinaKaefer() {
 
     super();
     speed = 2.0;
     noiseP = 0;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 16;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into five digits
      String filename = "ninakaefer.png";
      //"kaefer_" + nf(i, 5) + ".png";
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

class Biene extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  Biene() {
 
     super();
     speed = 2.0;
     noiseP = 0;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 16;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into five digits
      String filename = "biene.png";
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

class meinKaefer1 extends Kaefer {
 
  meinKaefer1() {
 
     super();
     speed = random(8);
     direction.rotate(random(PI));
     direction.mult(speed);
  }
    
  void draw() {
    // update position
    position.add(direction);
    checkBorder();
    
    // draw
    fill(#00D5D5);
    ellipse(position.x, position.y, 20, 20);
    
    //Schwanz
    PVector n = new PVector(direction.x, direction.y);
    n.normalize();
    line(
    position.x+n.x*10,
    position.y+n.y*10,
    position.x-n.x*40,
    position.y-n.y*40);
    
    
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
    position.x+f1.x*50,
    position.y+f1.y*50
    );
    f1.rotate(1);
    line(position.x+f1.x*10,
    position.y+f1.y*10,
    position.x+f1.x*50,
    position.y+f1.y*50
    );
  }
 
  void checkBorder() {
    
    if(position.x<0 || position.x>width) direction.x *= -1;
    if(position.y<0 || position.y>height) direction.y *= -1;
  }
}

class Kaefer2 extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  Kaefer2() {
 
     super();
     speed = 2.0;
     noiseP = 0;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 16;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into five digits
      String filename = "kaefer.png"; 
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

class dgKaefer extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  dgKaefer() {
 
     super();
     speed = 2.0;
     noiseP = 0;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 9;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into five digits
      String filename = "keafer_" + nf(i, 1) + ".png";
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

class NadjaKaefer extends Kaefer {

  NadjaKaefer() {

    super();
    speed = random(0.5, 5.0);
    direction.rotate(random(TWO_PI));
    direction.mult(speed);
  }

  void draw() {

    // update position
    position.add(direction);
    checkBorder();

    // draw
    fill(random(255), random(255), random(255));
    ellipse(position.x, position.y, 30, 30);


    // mittellinie
    PVector m = new PVector(direction.x, direction.y);
    m.normalize();
    line(position.x-m.x*15, 
    position.y-m.y*15, 
    position.x+m.x*15, 
    position.y+m.y*15
      );

    // fühler
    PVector f1 = new PVector(direction.x, direction.y);
    f1.normalize();
    f1.rotate(-0.5);
    line(position.x+f1.x*15, 
    position.y+f1.y*15, 
    position.x+f1.x*25, 
    position.y+f1.y*25
      );
    f1.rotate(1);
    line(position.x+f1.x*15, 
    position.y+f1.y*15, 
    position.x+f1.x*25, 
    position.y+f1.y*25
      );


    // punkt
    PVector p1 = new PVector(direction.x, direction.y);
    p1.normalize();
    fill(0);
    ellipse(position.x+p1.x+5, position.y+p1.x+5, 7, 7);
  }

  void checkBorder() {

    if (position.x<0 || position.x>width) direction.x *= -1;
    if (position.y<0 || position.y>height) direction.y *= -1;
  }
}

class LisaKaefer extends Kaefer {
  float noiseP;
  LisaKaefer() {
 
     super();
     speed = random(0.5, 8.0);
     noiseP = 0;
     direction.rotate(random(HALF_PI));
     direction.mult(speed);
  
  }
  
  void draw() {

    // update position
        noiseP += 0.0002;
    direction.rotate((noise(noiseP)-0.5)*0.05);
    position.add(direction);
    checkBorder();
    
    // draw
    fill(#B42639);
    ellipse(position.x, position.y, 40, 40);
    
    // mittellinie
    PVector m = new PVector(direction.x, direction.y);
    m.normalize();
    line(position.x-m.x*20,
    position.y-m.y*20, 
    position.x+m.x*20, 
    position.y+m.y*20
    );
    
    // fühler
    float r =random(255);
    float g =random(255);
    float b =random(255);
    stroke(r,g,b);
    strokeWeight(5);
    PVector f1 = new PVector(direction.x, direction.y);
    f1.normalize();
    f1.rotate(-0.5);
    line(position.x+f1.x*20,
    position.y+f1.y*20, 
    position.x+f1.x*35, 
    position.y+f1.y*35
    );
    f1.rotate(1);
    line(position.x+f1.x*20,
    position.y+f1.y*20, 
    position.x+f1.x*35, 
    position.y+f1.y*35
    );
    stroke(0,0,0);
    strokeWeight(1);
  }
  
  void checkBorder() {
    
    if(position.x<0 || position.x>width) {
      direction.x *= -1;
    }
    if(position.y<0 || position.y>height){
    direction.y *= -1;
    }
  }
}

class CarolinKaefer extends Kaefer {
 
  float noiseP;
 
  
  CarolinKaefer() {
 
    super();
    speed = random(0.5, 4.0);
    noiseP = 0;
    direction.rotate(random(TWO_PI));
    direction.mult(speed);
  }
 
 
  void draw() {
 
    // update position
    noiseP += 0.02;
    direction.rotate((noise(noiseP)-0.5)*0.05);
    position.add(direction);
    checkBorder();
 
    // draw
    float r = random(255);
    float g = random(255);
    float b = random(255);
    fill(r,g,b);
    strokeWeight(3);
    ellipse(position.x, position.y, 30, 30);
   
 
 
    // mittellinie
    PVector m = new PVector(direction.x, direction.y);
    m.normalize();
    strokeWeight(3);
    line(position.x-m.x*15,
    position.y-m.y*15,
    position.x+m.x*15,
    position.y+m.y*15
      );
 
    // fühler
    PVector f1 = new PVector(direction.x, direction.y);
    f1.normalize();
    f1.rotate(-0.5);
    strokeWeight(3);
    line(position.x+f1.x*15,
    position.y+f1.y*15,
    position.x+f1.x*30,
    position.y+f1.y*30
      );
    f1.rotate(1);
    line(position.x+f1.x*15,
    position.y+f1.y*15,
    position.x+f1.x*30,
    position.y+f1.y*30
      );
      strokeWeight(1);
  }
 
  void checkBorder() {
 
    if (position.x<0 || position.x>width) direction.x *= -1;
    if (position.y<0 || position.y>height) direction.y *= -1;
  }
}

class NatKaefer extends Kaefer {
NatKaefer() {
speed = 6;
direction.rotate(2);
direction.mult(speed);
}

void draw(){
position.add(direction);
direction.rotate(0.02);
checkBorder();

stroke(#FFA600);
fill(#FFF300);
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

class DaviKaefer extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
 
  DaviKaefer() {
 
     super();
     speed = 1.0;
     noiseP = 0;
     direction.rotate(random(TWO_PI));
     direction.mult(speed);
     
    imageCount = 4;
    images = new PImage[imageCount];
    frame = (int) random(imageCount);
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into five digits
      String filename = "_kaefer_" + nf(i, 5) + ".png";
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

class IsabelKaefer extends Kaefer {

 IsabelKaefer() {

    super();
    speed = random(0.5, 2.1);
    direction.rotate(sin(0.03));
    direction.mult(speed);
 }

 void draw() {
direction.rotate(sin(0.03));
   // update position
   position.add(direction);
   checkBorder();

   // draw
   fill(100,5,50);
   ellipse(position.x, position.y, 20, 20);

   // mittellinie
   stroke(255);
   PVector m = new PVector(direction.x, direction.y);
   m.normalize();
   line(position.x-m.x*10,
   position.y-m.y*10, 
   position.x+m.x*10, 
   position.y+m.y*10
   );

   // fühler
   stroke(0,50,50);
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
  
  float angle(PVector v1, PVector v2) {
    float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
    if (a < 0) a += TWO_PI;
    return a;
  }
}

class RominaKaefer2 extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  RominaKaefer2() {
 
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
      String filename = "imgKaefer.png";
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


class OwiKaeferNeumayr extends Kaefer {

PImage[] images;
int imageCount;
int frame;
float noiseP;

OwiKaeferNeumayr() {

super();
speed = 2.0;
noiseP = 0;
direction.rotate(random(TWO_PI));
direction.mult(speed);

imageCount = 12;
images = new PImage[imageCount];
frame = (int) random(imageCount);

for (int i = 0; i < imageCount; i++) {
// Use nf() to number format 'i' into five digits
String filename = "bug_" + nf(i, 5) + ".gif";
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

class CelineKaefer extends Kaefer {
  
  PImage[] images;
  int imageCount;
  int frame;
  float noiseP;
  
  CelineKaefer() {
 
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
      String filename = "marienkaefer1.png";
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


