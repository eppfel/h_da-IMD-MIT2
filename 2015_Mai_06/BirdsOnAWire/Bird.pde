int STATE_WAKE = 0;
int STATE_SLEEP = 1;
int STATE_SING = 2;

class Bird {
  
  String name;
 private PVector position; 
 private PImage[] wakeImg;
 private PImage[] sleepImg;
 private PImage[] singImg;
 private int frame; 
 private int state;
 private int timestamp;
 private int sleepWakeDuration;
  
  Bird(PVector pos, int startFrame) {
    position = pos;
    frame = startFrame;
    state = STATE_WAKE;
    timestamp = millis() - (int)random(8000);
    sleepWakeDuration = 8000;
    wakeImg = new PImage[3];
    sleepImg = new PImage[3];
    singImg = new PImage[3];
    for (int i = 0; i < 3; i++) {
        wakeImg[i] = loadImage("wake_" + (i+1) + ".png");
        sleepImg[i] = loadImage("sleep_" + (i+1) + ".png");
        singImg[i] = loadImage("sing_" + (i+1) + ".png");
     }
  }
  
  void draw() {
    if(millis()-timestamp>sleepWakeDuration) {
      timestamp = millis();
      if(state == STATE_WAKE) state = STATE_SLEEP;
      else state = STATE_WAKE;
    }
    frame = (frame+1) % 3;
     if(state == STATE_WAKE) image(wakeImg[frame], position.x, position.y);
     if(state == STATE_SLEEP) image(sleepImg[frame], position.x, position.y);
     if(state == STATE_SING) image(singImg[frame], position.x, position.y);
  }
  
  void tap(int x, int y) {
    if(inside(x, y)) state = STATE_SING;
  }
  
  void release() {
    if(state == STATE_SING) {
      timestamp = millis();
      state = STATE_WAKE;
    }
  }
  
  private boolean inside(int x, int y) {
    boolean inX = x>=position.x && x<= position.x+wakeImg[0].width;
    boolean inY = y>=position.y && y<= position.y+wakeImg[0].height;
    return inX && inY;
  }
  
}
