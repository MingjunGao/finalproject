class CaughtSc {
  float x, y; 
  float r; 
  CaughtSc(float tempcsx) {
    r = 80; 
    x =tempcsx; 
    y =300;
  }

  boolean reachedBottom() {
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    for (int i=0; i<totalcs; i++) {
      image(imgsc1, px, py-100-i*4, r, r);
    }
  }
}
