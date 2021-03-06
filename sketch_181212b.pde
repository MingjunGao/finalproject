Timer timer1; 
Timer timer2; 
Timer timer3; 
Timer timer4;
PFont myFont;
float px=100;
float py=300;
float pr=70;
float bx;
float by;
boolean touch;
float steep=4;
int totaleat_fruit=0;
int launch_fruit=0;
int caughtbc_fruit=10;
//PFont font;
PImage imgp;
PImage imgday;
PImage imgnight;
boolean Ff=false;
float fruit_x=width, fruit_y=height-100;
float backgrount_speed=width;
boolean dead = false;
boolean win= false;
boolean st;
PImage start;
PImage winwin;
PImage gameover;
boolean intersectp_f;
int score;
boolean dayday=false;

void setup() {
  background(255);
  myFont = createFont("Georgia", 40);
  size(800, 500);
  noSmooth();
  f=new Fruit[50];
  cf=new CaughtFruit[50];
  m = new M[50]; 
  sc = new SmallCao[40]; 
  bc=new BigCao();
  dog_x=int(random(200, 500));
  dog_y=0;
  dog_r=60;
  timer1 = new Timer(2500);//time of fruit.sc
  timer1.start(); // Starting the timer
  timer2 = new Timer(int(random(4000, 6000)));//time of dog
  timer2.start(); 
  timer3 = new Timer(40000);  //time of BigCao
  timer3.start(); 
  timer4 = new Timer(35000);
  timer4.start(); 
  imgsc1=loadImage("alpacabrown.gif");//sc1
  imgsc2=loadImage("alpacagray.gif");//sc2
  imgsc3=loadImage("alpacawhite.png");//sc3
  imgp=loadImage("person2.png");//p
  imgM=loadImage("M.png");//M
  imgfruit1=loadImage("fruit1.png");//fruit
  imgfruit2=loadImage("fruit2.png");
  imgfruit3=loadImage("fruit3.png");
  imgfruit4=loadImage("fruit4.png");
  imgfruit5=loadImage("fruit5.png");
  imgfruit=loadImage("fruit.png");
  imgdog=loadImage("dog.gif");
  imgday=loadImage("day.png");
  imgnight=loadImage("night.png");
  bush1=loadImage("bush04 copy.png");
  bush2=loadImage("bush08 copy.png");
  cloud1=loadImage("cloud01.png");
  cloud2=loadImage("cloud02.png");
  tree=loadImage("tree03 copy.png");
  start= loadImage("start.png");
  gameover=loadImage("gameover.jpg");
  winwin=loadImage("win.jpg");
  intersectp_f=false;
}

//person
void person() {
  image(imgp, px, py, pr, 1.3*pr);
}

//background
PImage bush1, bush2, cloud1, cloud2, tree;
void start_background() {
  image(bush1, backgrount_speed, height*0.65, 120, 60);
  image(bush2, backgrount_speed+400, height*0.55, 90, 60);
  image(cloud1, backgrount_speed+600, height*0.15, 150, 90);
  image(cloud2, backgrount_speed+200, height*0.1, 160, 70);
  image(tree, backgrount_speed+800, height*0.45, 90, 150);
  backgrount_speed-=3;
  if (backgrount_speed<-1000) {
    backgrount_speed=width;
  }
}

//cf
CaughtFruit[] cf;
int totalcf=0;
void start_cf() {
  if (launch_fruit>0) {
    for (int l = 0; l < launch_fruit; l ++ ) {
      cf[l].move();
      cf[l].display();
    }
    if ((launch_fruit>0)&&(Ff)) {
      for (int j = 0; j < launch_fruit; j ++ ) {
        if ((bc.intersect_bc(cf[j])||(cf[j].x>width))) {
          cf[j].caught();
          totaleat_fruit++;
        }
      }
    }
  }
}

//bc
BigCao bc;
void start_bc() {
  bx=bc.x;
  by=bc.y;
  if (timer3.isFinished()) {
    bc.display();
    bc.move();
  }

  fill(0, 255, 0);
  textFont(myFont);
  textAlign(CENTER);
  for (int h=0; h<3; h++) {
    if ((10-totaleat_fruit)>0) {
      text(10-totaleat_fruit, bx+bc.bc_r/2-40, by-bc.bc_r/2+60);
    } else if ((10-totaleat_fruit)==0) {
      text(0, bx+bc.bc_r/2-40, by-bc.bc_r/2+60);
    }
  }
  if ((10-totaleat_fruit)<=0) {
    win=true;
    bc.caught();
  }
  if ((bx==0)&&((10-totaleat_fruit)!=0)) {
    dead=true;
  }
}

//dog
PImage imgdog;
int  dog_x, dog_y, dog_r;
void start_dog() {
  image(imgdog, dog_x, dog_y, dog_r, 1.15*dog_r);
  dog_y+=steep;

  if (timer2.isFinished()) {
    if ((dog_x>width)||(dog_x<0)||(dog_y<0)||(dog_y>height)) {
      dog_x =int(random(200, 400));
      dog_y=0;
    }
    timer2.start();
  }

  for (int s=0; s<totalf; s++) {
    float ddf=dist(dog_x, dog_y, f[s].x, f[s].y);
    if (ddf<f[s].r+dog_r) {
      f[s].disappear();
    }
  }
  float ddp=dist(dog_x, dog_y, px, py);
  if ((ddp<pr+dog_r-20)&&(totalcs>2)) {
    int lose_sc=int(random(0, 3));
    totalcs=totalcs-lose_sc;
  }
}

//sc
PImage imgsc1, imgsc2, imgsc3;
SmallCao[] sc; 
int totalcs=0;
int totalsc = 0; 
void start_sc() {
  if (timer1.isFinished()) {
    sc[totalsc] = new SmallCao();
    f[totalsc] = new Fruit();
    totalsc ++ ;
    totalf ++ ;
    timer1.start();
  }
  if (totalf>50) {
    totalf=0;
  }
  for (int i = 0; i < totalsc; i ++ ) {
    sc[i].move();
    sc[i].display();
    sc[i].caughtmove();
    f[i].move();
    f[i].display();
    for (int j = 0; j < totalm; j ++ ) {
      if ((Mm)&&(m[j].intersect(sc[i]))) {
        sc[i].caught();
        m[j].ate();
        totalcs++;
      }
    }
  }
}

//f
PImage imgfruit1, imgfruit2, imgfruit3, imgfruit4, imgfruit5, imgfruit;
Fruit[] f;
int totalf=0;
void start_f() {
  for (int w = 0; w < totalf; w ++ ) {
    float distance = dist(px+pr/2, py+pr/2, f[w].x+f[w].r, f[w].y+f[w].r); 
    if (distance < pr/2 + f[w].r/2) { 
      f[w].caught();
      totalcf++;
    } else {
      intersectp_f= false;
    }
  }
  fill(0, 255, 0);
  textFont(myFont);
  textAlign(CENTER);
  if ((totalcf-launch_fruit)>0) {
    image(imgfruit1, 10, 10, 30, 30);
    text(totalcf-launch_fruit, 70, 40);
  } else {
    image(imgfruit1, 10, 10, 30, 30);
    text(0, 70, 40);
  }
}

//m
PImage imgM;
M[] m;
int totalm = 0; 
boolean Mm=false;
void start_m() {
  for (int t = 0; t < totalm; t ++ ) {
    m[t].move();
    m[t].display();
    if (m[t].x>width-20) {
      m[t].caught();
    }
  }
}

boolean[] keys = new boolean[256];
float pxv=0;
float pyv=0;
float rx=px;
float ry=py;
float pspeed=4;
float gravity=0;
boolean falling = true;
void keyPressed() {
  Ff=true;
  keys[keyCode]=true;
}
void keyReleased() {
  keys[keyCode]=false;
  gravity=0;
  pyv=0;
}
void playerInput() {
  pyv=0;
  if ((dead==false) &&keys[keyCode]) {
    if (keys[UP] && falling==false) {
      gravity+=2;
    }
    if (keys[DOWN] && falling==false) {
      gravity=0;
      pyv=0;
    }
    if ((keys[LEFT])&&(px>=0)) {
      px-=pspeed;
    }
    if ((keys[RIGHT]) &&(px<=width)) {
      px+=pspeed;
    }
    pyv-=gravity;
    gravity+=3;
    falling = true;
  }
}

void playerUpdate() {
  if ((keys[LEFT]) || (keys[RIGHT])) {
    px+=pxv;
  }
  if (keys[UP] ) {
    py+=pyv;
  }
  fill(255, 0, 0);
  if (dead==true) {
    image(gameover, 0, 0, width, height);
  }
}

void draw() {
  if (dead==true) {
    image(gameover, 0, 0, width, height);
  }
  if (win==true) {
    score=totalcs;
    textSize(52);
    image(winwin, 0, 0, width, height);
    text("YOUR SCORE:", 380, 300);
    text(score, 580, 295);
  }

  if ((dead==false)&&(win==false)) {
    if (dayday) {
      image(imgnight, 0, 0, width, height);
    }else{
      image(imgday, 0, 0, width, height);
  }
  frameRate=60;
  if ((st==true)&&(win==false)) {
    start_background() ;
    //px=rx;
    py=ry;
    playerUpdate();
    playerInput() ;
    person();
    if ((py+pr)>400) {
      pyv=0;
      falling=false;
      gravity=0;
    }
    start_cf();
    start_bc();
    start_dog();
    start_sc();
    start_f();
    start_m();
  }
  if (st==false) {
    background(250);
    image(imgday, 0, 0, width, height);
    image(start, 280, 130);
  }
}
if (timer3.isFinished()) {
  dayday=true;
}

}

void mouseClicked() {
  if ( (dist(mouseX, mouseY, width/2, height/2)<=100)&&(st==false)) {
    st = true;
  }
  if (dead==true) {
    if (dist(mouseX, mouseY, width/2, 275)<=50) {
      dead =false;
      st=true;
    }

    f=new Fruit[50];
    cf=new CaughtFruit[50];
    m = new M[50]; 
    sc = new SmallCao[40]; 
    bc=new BigCao();
    timer1 = new Timer(2500);
    timer1.start(); 
    timer2 = new Timer(int(random(4000, 6000)));
    timer2.start(); 
    timer3 = new Timer(40000); 
    timer3.start(); 
    timer4 = new Timer(35000); 
    timer4.start(); 
    intersectp_f=false;
    totalcf=0;
    totalcs=0;
    totalsc = 0;
    totalf=0;
    totalm = 0;
    launch_fruit=0;
    bx=bc.x;
    totaleat_fruit=0;
    dayday=false;
  }
}
void mousePressed() {
  if (mouseButton == LEFT) {
    Mm=true;
    m[totalm]= new M(px);
    totalm ++ ;
    if (totalm >=m.length) {
      totalm = 0;
    }
  } else if ((mouseButton ==RIGHT)) {
    Ff=true;
    if (launch_fruit<totalcf) {
      cf[launch_fruit]=new CaughtFruit(px);
      launch_fruit++;
    }
  }
}
