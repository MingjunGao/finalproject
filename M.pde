class M {
  float r; 
  float x, y;
  float speed; 
  M(float tempx) {
    x=tempx;
    r = 10;
    speed=5;
    y=py;
  }

  void move() {
    x += speed;
  }
  void display() {
    image(imgM, x+50, y+10, r, r);
  }

  boolean intersect(SmallCao sca) {
    float distance = dist(x+r/2, y+r/2, sca.x+sca.r/2, sca.y+sca.r/2); 
    if (distance < r/2 + sca.r/2) { 
      return true;
    } else {
      return false;
    }
  }
  void ate() {
    speed = 0; 
    x = -1800;
  }
  void caught() {
    speed = 0; 
    y = -1800;
  }
}
