class SmallCao {
  float x, y; 
  float speed; 
  float r; 
  SmallCao() {
    r = 80; 
    x =width; 
    y = 350-random(0,100); 
    speed = random(1, 4);
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
    image(imgsc1, x, y-48, r, r);
  }

  void caught() {
    speed = 0; 
    y = -1000;
  }
}
