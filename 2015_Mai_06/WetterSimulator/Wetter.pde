class Wetter {
  
private float[] temperatur; // C°
private float[] luftfeuchte; // %
private float[] sonnenschein; // Monatsumme in Stunden
private float[] niederschlag; // l/m2
private float[] schneehoehe; // cm
  
  Wetter() {
   
    temperatur = new float[]{0.6,  1.1,  4.4,  9.2,  13.2,  16.3,  18.4,  17.7,  13.8,  9.6,  5.2,  1.4};
    luftfeuchte = new float[]{85,  82,  75,  69,  67,  69,  70,  73,  80,  83,  85,  86};
    sonnenschein = new float[]{45.4,  72.3,  122.1,  157.7,  221.6,  220.9,  218.0,  210.2,  156.3,  110.8,  52.4,  37.4};
    niederschlag = new float[]{43.2,  36.6,  37.5,  42.2,  55.3,  70.7,  53.1,  65.3,  45.5,  35.8,  49.5,  54.5};
    schneehoehe = new float[]{9.5,  9.9,  7.3,  1.1,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  3.4,  6.7}; 
    
  }
  
  // position from 0.0 to 1.0
  public float getTemperatur(float position) { return getValue(temperatur, position);}
  public float getLuftfeuchte(float position) { return getValue(luftfeuchte, position);}
  public float getNiederschlag(float position) { return getValue(niederschlag, position);}
  public float getSonnenschein(float position) { return getValue(sonnenschein, position);}
  public float getSchneehoehe(float position) { return getValue(schneehoehe, position);}
  
  private float getValue(float[] data, float pos) {
    
    pos = constrain(pos, 0, 1);
    int dLength = data.length;
    int p = (int) (dLength* pos);
    int p2 = p+1;
    if(p2>dLength-1) p2 = 0;
    float amt = (dLength* pos) - p;
    return lerp(data[p], data[p2], amt);
  }
}
