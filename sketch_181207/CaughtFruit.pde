class CaughtFruit {
  float x, y; 
  float r; 
  float speed; 
  CaughtFruit(float tempx,float tempy) {
    r = 80; 
    x =tempx;
    y =tempy;
  }

  boolean reachedBottom() {
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }
  void display() {
    image(imgfruit, x, y, r, r);
  }
  void move() {
    x+=speed;
  }
  void clear_f() {
    speed = 0; 
    x = -1000;
  }
}
