
float[] temperatur; // C°

int datenSize;
int dSize;
float position;
float value;

void setup() {
  size(640, 360);
  // Durchschnitt Temperatur C Deutschland  (2001 bis 2014)
  temperatur = new float[]{0.6,  1.1,  4.4,  9.2,  13.2,  16.3,  18.4,  17.7,  13.8,  9.6,  5.2,  1.4};
  
  datenSize = temperatur.length;
  dSize = datenSize-1;
  
  position = 0;
  value = 0;
}

void draw() {

  background(255);
  
  for(int i=0; i<dSize; i++) {
   
   stroke(0);
   line(100+i*30, 300-temperatur[i]*10, 100+(i+1)*30, 300-temperatur[i+1]*10);
   fill(255, 255, 0);
   ellipse(100+i*30, 300-temperatur[i]*10, 4, 4);
   if(i==dSize-1) ellipse(100+(i+1)*30, 300-temperatur[i+1]*10, 4, 4);
  }
  stroke(255, 0, 0);
  line(100+position*dSize*30, 60, 100+position*dSize*30, 320);
  
  fill(0);
  value = getValue(temperatur, position);
  String pStr = "position " +nf(position,1,2) + "\nvalue " + nf(value,1, 2);;
  text(pStr, 10, 30);
}

float getValue(float[] data, float pos) {
  
  int dLength = data.length-1;
  int p = (int) (dLength* pos);
  int p2 = min(p+1, dLength);
  float amt = (dLength* pos) - p;
  return lerp(data[p], data[p2], amt);
}

void mouseMoved() {
  
  position = constrain((float)(mouseX-100) / (float) (dSize*30), 0, 1);
}


