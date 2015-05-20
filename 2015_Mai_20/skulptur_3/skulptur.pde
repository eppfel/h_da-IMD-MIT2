class skulptur {
 int anzahlX;
 int anzahlY; 
 float abstand;
 // KLAUSUR - aggregation / compositing
 ArrayList<lampe> alleLampen;
  
  skulptur(int x, int y) {
   anzahlX = x;
   anzahlY = y;
   abstand = 80;
   float startX = (anzahlX*abstand)/2;
   float startZ = (anzahlY*abstand)/2;
   
   alleLampen = new ArrayList<lampe>();
   // KLAUSUR - loop
   for(int i=0; i<anzahlX; i++) {
    for(int j=0; j<anzahlY; j++) {
      alleLampen.add( 
      new lampe(-startX+i*abstand,0, -
      startZ +j*abstand) );
    }
   }  
  }
  void draw() {
   for(int i=0; i<alleLampen.size(); i++) {
     // KLAUSUR - Array
    lampe L = alleLampen.get(i);   
    L.show();
   }
  } 
}
