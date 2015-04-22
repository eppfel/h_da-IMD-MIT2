void setup() {
  size(512, 512);
  noLoop();
  println(divideByTwo(1023));
}

int divideByTwo(int dividend) {
  int result;
  if (dividend % 2 == 0) {
    result = divideByTwo(dividend / 2);
  }
  else {
    result = dividend;
  }
  return result;
}
