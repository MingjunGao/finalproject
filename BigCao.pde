//boss file 
//move 
//displahy alpaca image large 
class BigCao {
  float x, y; 
  float speed; 
  float bc_r; 
  float distance_cf;
  BigCao() {
    bc_r =140; 
    x =width; 
    y = 280; 
    speed = 1+int(random(1,2));
  }

  void move() {
    x -= speed;
  }

  boolean intersect_bc(CaughtFruit bc_cf) {//if catch fruit 
    distance_cf = dist(x+bc_r/2, y+bc_r/2, bc_cf.x+bc_cf.r/2, bc_cf.y+bc_cf.r/2); //center 
    if (distance_cf < bc.bc_r/2 + bc_cf.r/2) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    image(imgsc1, x, y, bc_r, bc_r);
  }
  //if caught stops 
  void caught() {
    speed = 0; 
    y = -600;
  }
}
