class M {
  float r; 
  float x, y;
  float dropx;
  //float start_x, start_y;
  float speed; 
  M(float tempx) {
    x=tempx;
    r = 10;
    speed=5;
    y=py;
  }

  void move() {
    x += speed;
    //y=500/dropx/dropx*x*x-250/dropx*x+350;
  }
  void display() {
    image(imgM, x+50, y-45, r, r);
  }

  boolean intersect(SmallCao sca) {
    float distance = dist(x+r/2, y+r/2, sca.x+sca.r/2, sca.y+sca.r/2); 
    if (distance < r/2 + sca.r/2-12) { 
      return true;
    } else {
      return false;
    }
  }
  void ate() {
    speed = 0; 
    x = -1000;
  }
}
