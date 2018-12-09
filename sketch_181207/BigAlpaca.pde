class BigCao {
  float x, y; 
  float speed; 
  float r; 
  BigCao() {
    r =150; 
    x =width; 
    y = 350-random(0, 100); 
    speed = 2;
  }

  void move() {
    x -= speed;
  }

  boolean reachedBottom() {
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    image(imgsc1, x, y-150, r, r);
  }

  void caught() {
    speed = 0; 
    y = -1000;
  }
}