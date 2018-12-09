M[] m;
Person p;
BigCao bc;
Fruit[] f;
Timer timer; 
float px;
float py;
SmallCao[] sc; 
CaughtSc[] cs;
CaughtFruit[] cf;
int totalsc = 0; 
int totalm = 0; 
int totalf=0;
float steep=4;
int totalcs=0;
int totalcf=0;
int launch_fruit=0;
PFont font;
PImage imgsc1, imgsc2, imgsc3, imgp, img5, imgM, imgfruit1, imgfruit2, imgfruit3, imgfruit4, imgfruit5, imgfruit;
PImage imgbackground;
boolean Mm=false;
boolean Ff=false;
float fruit_x=width, fruit_y=height-100;
void setup() {
  background(255);
  font=createFont("Arial", 30);
  size(800, 500);
  smooth();
  p=new Person (100, 350);
  f=new Fruit[50];
  cf=new CaughtFruit[50];
  m = new M[50]; 
  sc = new SmallCao[30]; 
  cs = new CaughtSc[30]; 
  timer = new Timer(2000); 
  timer.start(); // Starting the timer
  imgsc1=loadImage("alpacabrown.gif");//sc1
  imgsc2=loadImage("alpacagray.gif");//sc2
  imgsc3=loadImage("alpacawhite.png");//sc3
  imgp=loadImage("person2.png");//p
  img5=loadImage("tree03 copy.png");//SmallCao
  imgM=loadImage("M.png");//M
  imgfruit1=loadImage("fruit1.png");
  imgfruit2=loadImage("fruit2.png");//fruit
  imgfruit3=loadImage("fruit3.png");
  imgfruit4=loadImage("fruit4.png");
  imgfruit5=loadImage("fruit5.png");
  imgfruit=loadImage("fruit.png");
  imgbackground=loadImage("background.jpg");
}
void draw() {
  image(imgbackground, 0, 0, width, height);
  //background(255);
  frameRate=60;
  println(frameCount);
  px=p.x;
  py=p.y;
  p.display();
  //bc
  //if (frameCount==10000) {
  //  bc = new BigCao();
  //}
  //bc.move();
  //bc.display();
  //sc
  if (timer.isFinished()) {
    sc[totalsc] = new SmallCao();
    f[totalsc] = new Fruit();
    totalsc ++ ;
    totalf ++ ;
    if (totalsc >= sc.length) {
      totalsc = 0;
    }
    timer.start();
  }

  for (int i = 0; i < totalsc; i ++ ) {
    sc[i].move();
    sc[i].display();
    f[i].move();
    f[i].display();
    for (int j = 0; j < totalm; j ++ ) {
      if ((Mm)&&(m[j].intersect(sc[i]))) {
        //SmallCao.remove(i);
        sc[i].caught();
        m[j].ate();

        cs[totalcs]=new CaughtSc(px);
        totalcs++;
      }
    }
  }

  //cs
  for (int k = 0; k < totalcs; k ++ ) {
    cs[k].display();
  }

  //cf
  for (int w = 0; w < totalf; w ++ ) {
    if ((Ff)&(p.intersect(f[w]))) {
      f[w].caught();
      totalcf++;
    }
  }
  if (mousePressed && (mouseButton == RIGHT)&&(launch_fruit>0)&&(launch_fruit<totalcf)) {
    cf[launch_fruit].display();
    cf[launch_fruit].move();
    launch_fruit++;
  }
  fill(0, 255, 0);
  textFont(font);
  textAlign(CENTER);
  text(totalcf, px+p.r/2, py-p.r/2);

  //m
  for (int t = 0; t < totalm; t ++ ) {
    m[t].move();
    m[t].display();
  }
}

//m
void mousePressed() {
  if (mouseButton == LEFT) {
    Mm=true;
    m[totalm]= new M(p.x);
    totalm ++ ;
    if (totalm >=m.length) {
      totalm = 0;
    }
  } else if (mouseButton ==RIGHT) {
    cf[launch_fruit]=new CaughtFruit(p.x, p.y);
    //if (launch_fruit<totalcf) {
    //  cf[launch_fruit]=new CaughtFruit(p.x, p.y);
    launch_fruit++;
  }
}

void keyPressed() {
  Ff=true;
  if (key == CODED) {
    if ((keyCode == DOWN)&&(p.y>=50)) {
      p.y+=steep;
    }
    if ((keyCode == UP)&&(p.y<=600)) {
      p.y-=steep;
    }
    if ((keyCode == LEFT)&&(p.x>=0)) {
      p.x-=steep;
    }
    if ((keyCode == RIGHT)&&(p.x<=width)) {
      p.x+=steep;
    }
  }
}