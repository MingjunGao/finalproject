class Fruit {
  float x;
  float y;
  float r;
  float speed;
  PImage img;
  float df;

  Fruit() {
    x=width;
    y=280;
    r=40;
    speed=random(3, 6);
    df=random(0, 1);
    if (df<0.2) {
      img=imgfruit1;
    } else if (df<0.4) {
      img=imgfruit2;
    } else if (df<0.6) {
      img=imgfruit3;
    } else if (df<0.8) {
      img=imgfruit4;
    } else {
      img=imgfruit5;
    }
  }

  void display() {
    image(img, x, y-50, r, r);
  }
  void move() {
    x-=speed;
  }
  void caught() {
    speed = 0; 
    y = -1000;
  }
}
