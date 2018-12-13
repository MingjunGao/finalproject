
//player catches fruits, save it for the final boss 
class CaughtFruit {
  float x, y; 
  float r; 
  float speed; 
  CaughtFruit(float tempx) {
    x =tempx;
    r = 35; 
    speed=5;
    y=py-10;
  }
  void move() {
    x+=speed;
  }
  void display() {
    image(imgfruit, x, y, r, r);
  }
  void eat() {//boss eats  
    speed = 0; 
    y = -1300;
  }
  void caught() {
    speed = 0; 
    y = -1600;;
  }
}
