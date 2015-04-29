/**
 * Functions.
 *
 * The drawTarget() function makes it easy to draw many distinct targets.
 * Each call to drawTarget() specifies the position, size, and number of
 * rings for each target.
 */


void setup() {
  size(640, 360);
  background(51);
  noStroke();
  noLoop();
}

void draw() {
  drawTarget(width*0.25, height*0.4, 200, 4);
  drawTarget(width*0.5, height*0.5, 300, 10);
  drawTarget(width*0.75, height*0.3, 120, 6);
}

void drawTarget(float xloc, float yloc, int size, int num) {
  float steps = size/num;
  for (int i = 0; i < num; i++) {
    fill(calcGrayValue(i, num));
    rect(xloc - size/2 + i*steps*.5, yloc - size/2 + i*steps*.5, size - i*steps, size - i*steps);
  }
}

float calcGrayValue(int n, int num) {
  n = num - n;
  return map(n*n, 0, num*num, 0, 255);
}
