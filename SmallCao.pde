//little monsters 
//check the text bottom 
class SmallCao {
  float x, y; 
  float rspeed; 
  float r; //size 
  boolean touch;//touch alpacas 
  int dy;
  float dsc;//push different alpacas 
  PImage imgsc;//original 
  
  SmallCao() {
    r = 60; 
    x =width; 
    y = 400-random(100, 200); 
    rspeed = random(1, 4);
    touch=false;
    dy=4;
    
    dsc=random(0, 1);
    if (dsc<0.33) {
      imgsc=imgsc1;
    } else if (dsc<0.66) {
      imgsc=imgsc2;//change to another color
    } else
      imgsc=imgsc3;//change to anorther color 
  }

  void move() {//move from left to right 
    x -= rspeed;
  }

  void display() {
    image(imgsc, x, y, r, r);
  }
//if cath the alpaca touch =true 
  void caught() {
    rspeed = 0; 
    y = -2100;
    touch=true;
  }
  
  //counting text on top when catch alpacas(touch==true), adding the number
  void caughtmove() {//counting system 
    if (touch) {
      fill(255, 162, 13);//orange color 
      textFont(myFont); 
      textAlign(CENTER);   
      if (totalcs>0) {
        image(imgsc2, 10, 50, 35, 35); //alpacas image
        text(totalcs, 70, 80);
      } else {
        image(imgsc1, 10, 50, 35, 35);
        text(0, 70, 80);
      }
    }
  }
}
