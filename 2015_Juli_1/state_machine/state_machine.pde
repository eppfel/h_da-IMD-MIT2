// define the states
final int STATE_FLUID        = 0;
final int STATE_FREEZED      = 1;
final int STATE_BOILING      = 2;
final int STATE_HIGHDENSINTY = 3;

int state;
PImage[] stateImages;

void setup() { 
  size(200, 200); 
  stateImages = new PImage[4];
  stateImages[STATE_FLUID] = loadImage("fluid.png");
  stateImages[STATE_FREEZED] = loadImage("freezed.png");
  stateImages[STATE_BOILING] = loadImage("boiling.png");
  stateImages[STATE_HIGHDENSINTY] = loadImage("dense.png");
  
  state = STATE_FLUID;
}

void draw() { 
  // set the states...
  int temperatur = (int)(mouseX/(float)width *250.0 -100.0);
  if(temperatur <= 0) state = STATE_FREEZED;
  if(temperatur > 0) state = STATE_FLUID;
  if(temperatur >= 100) state = STATE_BOILING;
  if(temperatur == 4) state = STATE_HIGHDENSINTY;
  
  // use the states
  print(temperatur); print(" "); println(state);
  image(stateImages[state], 0, 0);
  if(state == STATE_BOILING) println("water is boiling");
  switch(state) {
   case STATE_FREEZED:
   // make something freezed
   break;
   case STATE_BOILING:
   // make something boiled
   break;
  }
}
