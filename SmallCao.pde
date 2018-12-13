class SmallCao {
  float x, y; 
  float rspeed; 
  float r; 
  boolean touch;
  int dy;
  float dsc;
  PImage imgsc;
  SmallCao() {
    r = 60; 
    x =width; 
    y = 400-random(100, 200); 
    rspeed = random(1, 4);
    touch=false;
    dy=4;
    dsc=random(0, 1);
    if (dsc<0.33) {
      imgsc=imgsc1;
    } else if (dsc<0.66) {
      imgsc=imgsc2;
    } else
      imgsc=imgsc3;
  }

  void move() {
    x -= rspeed;
  }

  void display() {
    image(imgsc, x, y, r, r);
  }

  void caught() {
    rspeed = 0; 
    y = -2100;
    touch=true;
  }
  void caughtmove() {
    if (touch) {
      fill(0, 255, 0);
      textFont(myFont);
      textAlign(CENTER);
      if (totalcs>0) {
        image(imgsc1, 10, 50, 35, 35);
        text(totalcs, 70, 80);
      } else {
        image(imgsc1, 10, 50, 35, 35);
        text(0, 70, 80);
      }
    }
  }
}
