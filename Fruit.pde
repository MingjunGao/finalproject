//adding fruit 
class Fruit {
  float x;
  float y;
  float r;
  
  float speed;
  PImage img;
  float df;
  //set up catch fruit for player and dog 
  boolean catchfruit;//
  Fruit() {
    x=width;
    y=random(200,300);//low 
    r=35;
    speed=random(3, 6);
    df=random(0, 1);
    catchfruit=false;
    //fx=px;
    //fy=py;

    if (df<0.2) {//using five friuts images  if divided by 02
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
    image(img, x, y, r, 1.08*r);
  }
  void move() {//move from left to right
    x-=speed;
    //fx+=speed;
  }
  void caught() {//touch
   yep.rewind();//sound effect if catch restart
    yep.play();
    
    speed = 0; 
    y = -500;
    catchfruit=true;
  }
  void disappear() {//out of fram
    speed = 0; 
    y = -500;
  }
}
