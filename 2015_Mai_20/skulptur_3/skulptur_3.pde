skulptur eineSkulptur;
spezialLampe spezial;
float orbit = 0;
void setup() {
 size(1600, 1200, P3D); 
 // KLAUSUR - object instanciation
 eineSkulptur = new skulptur(40, 20);
 spezial = new spezialLampe(0, 0, 0);
 noStroke();
 sphereDetail(8);
}

void draw() {
  background(0);
  // orbit camera
  orbit += 0.001;
  float distanz = 2000;
  //float xOff = sin((float)mouseX*0.01)*distanz;
  //float zOff = cos((float)mouseX*0.01)*distanz;
  //camera(width/2+xOff, mouseY, zOff, width/2, height/2, 0, 0, 1, 0);
  float xOff = sin((float)orbit)*distanz;
  float zOff = cos((float)orbit)*distanz;
  camera(width/2+xOff, height, zOff, width/2, height/2, 0, 0, 1, 0);
  lights();
  pushMatrix();
  translate(width/2, height/2);
  // hier kommt die skulptur hin
  eineSkulptur.draw();
  spezial.show();
  popMatrix();
  camera();
  noLights();
  textSize(12);
  text("fps: "+(int)frameRate, 20, 20);
}
