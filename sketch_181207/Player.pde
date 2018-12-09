class Person {
  float r; 
  float x, y; 
  //float start_x,start_y;
  Person(float tempx,float tempy) {
    r = 70;
    x = tempx;
    y = tempy;
  }
  void display() {
    image(imgp, x, y-50, r, 1.3*r);
  }
  void displaycs(){
    image(imgsc1, x, y, 80, 80);
  }
    boolean intersect(Fruit ff) {
    float distance = dist(x+r/2, y+r/2, ff.x+ff.r, ff.y+ff.r); 
    if (distance < r/2 + ff.r/2-5) { 
      return true;
    } else {
      return false;
    }
  }
}
