//new globals
int nextConnectionNo = 500;
Population pop;
int frameSpeed = 60;
int framerate = 60;
int generation = 1; 
boolean showBestEachGen = false;
int upToGen = 0;
Player genPlayerTemp;

boolean showNothing = false;


//globals
 int fitness;
 int bestfitness;
 float random;
 
 float tlx = -100;
 float mlx = -100;
 float blx = -100;
 float tprx = 810;
 float mrx = 810;
 float brx = 810;
 
 float tly = 260;
 float mly = 370;
 float bly = 460;
 float tpry = 260;
 float mry = 370;
 float bry = 460;
 int posx;
 int mostdodged = 0;
 int bestfitgen = 0;
 int bestdodgedgen = 0;
 
 int random1;
 boolean can_shoot1 = true;
 
 int random2;
 boolean can_shoot2 = true;
 
 int random3;
 boolean can_shoot3 = true;
 
 int random4;
 boolean can_shoot4 = true;
 
 int random5;
 boolean can_shoot5 = true;
 
 int random6;
 boolean can_shoot6 = true;
 
 int playernum = 7500;
 int alive = playernum;
 
 int obst1 = 0;
 int obst2 = 0;
 int obst3 = 0;
 int obst4 = 0;
 int obst5 = 0;
 int obst6 = 0;
 
 int difficulty = 800;
 int mintime = 50;
 
 int randomAddition1 = floor(random(difficulty));
 int randomAddition2 = floor(random(difficulty));
 int randomAddition3 = floor(random(difficulty));
 int randomAddition4 = floor(random(difficulty));
 int randomAddition5 = floor(random(difficulty));
 int randomAddition6 = floor(random(difficulty));
 
 boolean shoot1 = false;
 boolean shoot2 = false;
 boolean shoot3 = false;
 boolean shoot4 = false;
 boolean shoot5 = false;
 boolean shoot6 = false;
 
 int a;
 int s;
 int d;
 int f;
 int g;
 int h;
 int j;
 int k;
 int l;
 int z;
 int x;
 int c;
 int v;
 int b;
 int n;
 int m;
 int q;
 int w;
 int e;
 int r;
 int t;
 
 //------------------------------------------------------------------------------------------
 
 
void setup() {
 size(710, 480);
 //fullScreen();
 frameRate(60);
  pop = new Population(playernum);
}

void draw(){
  background(255);
   if (showBestEachGen) {//show the best of each gen
    if (!genPlayerTemp.dead) {//if current gen player is not dead then update it
      genPlayerTemp.show();
      genPlayerTemp.look();
      genPlayerTemp.think();
      genPlayerTemp.update();
    } else {//if dead move on to the next generation
      upToGen ++;
      if (upToGen >= pop.genPlayers.size()) {//if at the end then return to the start and stop doing it
        upToGen= 0;
        showBestEachGen = false;
      } else {//if not at the end then get the next generation
        genPlayerTemp = pop.genPlayers.get(upToGen).cloneForReplay();
      }
    }
  } else {//if just evolving normally
    if (!pop.done()) {//if any players are alive then update them
      pop.updateAlive();
    } else {//all dead
      //genetic algorithm 
      pop.naturalSelection();
      resetLasers();
    }
  }
//---------------------------------------------------------------------------------------------------------------------------------------------------------
  //player
  //  rect(posx, posy, 50, 90);
  
  //top left 
  rect(tlx, tly, 60, 10);
  
  //middle left
  rect(mlx, mly, 60, 10);
  
  //bottom left
  rect(blx, bly, 60, 10);
  
  //top right
  rect(tprx, tpry, 60, 10);
  
  //middle right
  rect(mrx, mry, 60, 10);
  
  //bottom right
  rect(brx, bry, 60, 10);
 
//top to bottom
if (fitness > 000){
  rng1();
  shoot1();
  reset1();
  obst1 ++;
}


if (fitness > 000){
  rng2();
  shoot2();
  reset2();
  obst2 ++;
}


rng3();
shoot3();
reset3();
obst3 ++;


if (fitness > 000){
  rng4();
  shoot4();
  reset4();
  obst4 ++;
}


if (fitness > 000){
  rng5();
  shoot5();
  reset5();
  obst5 ++;
}


rng6();
shoot6();
reset6();
obst6 ++;


frameRate(framerate);

fitness++;

drawBrain();
bestfitness();
logs();
    fill(0);
    textSize(40);
      text("Gen: " + generation, 600, 450);
      
      textSize(20);
      text("Score: " + fitness, 70, 20);  
      
      textSize(20);
      text("Best: " + bestfitness, 620, 20);
      textSize(13);
      text("Gen " + bestfitgen, 620, 40);
      textSize(20);
      text("Max Dodge " + mostdodged, 75, 80);
      textSize(13);
      text("Gen " + bestdodgedgen, 75, 100);
      
      textSize(20);
      text("Framerate: " + framerate, 340, 20);
}

//----------------------------------------------------------------------------------------------------------

void drawBrain() {  //show the brain of whatever genome is currently showing
  int startX = 155;
  int startY = 0;
  int w = 400; //710
  int h = 200;
  if (showBestEachGen) {
    genPlayerTemp.brain.drawGenome(startX, startY, w, h);
  } else {
    for (int i = 0; i< pop.pop.size(); i++) {
      if (!pop.pop.get(i).dead) {
        pop.pop.get(i).brain.drawGenome(startX, startY, w, h);
        break;
      }
    }
  }
}
//----------------------------------------------------------------------------------------------------------
//LEFT

// TL
void rng1(){
  if (can_shoot1 == true){
    obst1 ++;
    shoot1 = false;
   if (obst1 > mintime + randomAddition1){
     shoot1 = true;
    
   }
  }
}
void shoot1(){
if(shoot1 == true){
  can_shoot1 = false; 
  go1();
  randomAddition1 = floor(random(difficulty));
  obst1 = 0;
}
}

void go1(){
   tlx += 7;
}

void reset1(){
  if (tlx >= 810){
    tlx = -100;
    can_shoot1 = true;
  }
}

// ML
void rng2(){
  if (can_shoot2 == true){
    obst2 ++;
    shoot2 = false;
   if (obst2 > mintime + randomAddition2){
     shoot2 = true;
    
   }
  }
    
}

void shoot2(){
if(shoot2 == true){
  can_shoot2 = false; 
  go2();
  randomAddition2 = floor(random(difficulty));
  obst2 = 0;
}
}
void go2(){
   mlx += 7;
}

void reset2(){
  if (mlx >= 810){
    mlx = -100;
    can_shoot2 = true;
  }
}

// BL
void rng3(){
  if (can_shoot3 == true){
    obst3 ++;
    shoot3 = false;
   if (obst3 > mintime + randomAddition3){
     shoot3 = true;
    
   }
  }
}

void shoot3(){
if(shoot3 == true){
  can_shoot3 = false; 
  go3();
  randomAddition3 = floor(random(difficulty));
  obst3 = 0;
}
}
void go3(){
   blx += 7;
}

void reset3(){
  if (blx >= 810){
    blx = -100;
    can_shoot3 = true;
  }
}

// TPR
void rng4(){
  if (can_shoot4 == true){
    obst4 ++;
    shoot4 = false;
   if (obst4 > mintime + randomAddition4){
     shoot4 = true;
    
   }
  }
}

void shoot4(){
if(shoot4 == true){
  can_shoot4 = false; 
  go4();
  randomAddition4 = floor(random(difficulty));
  obst4 = 0;
}
}
void go4(){
   tprx -= 7;
}

void reset4(){
  if (tprx <= -100){
    tprx = 810;
    can_shoot4 = true;
  }
}

// MR
void rng5(){
  if (can_shoot5 == true){
    obst5 ++;
    shoot5 = false;
   if (obst5 > mintime + randomAddition5){
     shoot5 = true;
    
   }
  }
}

void shoot5(){
if(shoot5 == true){
  can_shoot5 = false; 
  go5();
  randomAddition5 = floor(random(difficulty));
  obst5 = 0;
}
}
void go5(){
   mrx -= 7;
}

void reset5(){
  if (mrx <= -100){
    mrx = 810;
    can_shoot5 = true;
  }
}

// BR
void rng6(){
  if (can_shoot6 == true){
    obst6 ++;
    shoot6 = false;
   if (obst6 > mintime + randomAddition6){
     shoot6 = true;
    
   }
  }
}

void shoot6(){
if(shoot6 == true){
  can_shoot6 = false; 
  go6();
  randomAddition6 = floor(random(difficulty));
  obst6 = 0;
}
}
void go6(){
   brx -= 7;
}

void reset6(){
  if (brx <= -100){
    brx = 810;
    can_shoot6 = true;
  }
}

void resetLasers(){
tlx = -100;
 mlx = -100;
 blx = -100;
 tprx = 810;
 mrx = 810;
 brx = 810;
 
 tly = 260;
 mly = 370;
 bly = 460;
 tpry = 260;
 mry = 370;
 bry = 460;
 alive = playernum;
 
 random1 = 0;
can_shoot1 = true;
 
random2 = 0;
can_shoot2 = true;
 
random3 = 0;
 can_shoot3 = true;
 
random4 = 0;
can_shoot4 = true;
 
random5 = 0;
can_shoot5 = true;
 
random6 = 0;
can_shoot6 = true;
generation += 1;
randomAddition1 = floor(random(difficulty));
randomAddition2 = floor(random(difficulty));
randomAddition3 = floor(random(difficulty));
randomAddition4 = floor(random(difficulty));
randomAddition5 = floor(random(difficulty));
randomAddition6 = floor(random(difficulty));

obst1 = 0;
obst2 = 0;
obst3 = 0;
obst4 = 0;
obst5 = 0;
obst6 = 0;
shoot1 = false;

fitness = 0;
}

void bestfitness(){
if (fitness > bestfitness) {
bestfitness = fitness;
bestfitgen = generation;
}
}
void logs(){
if(generation == 1){
a = bestfitness;
}
if (generation == 100){
s = bestfitness;
}
if (generation == 200){
d = bestfitness;
}
if (generation == 300){
f = bestfitness;
}
if (generation == 400){
g = bestfitness;
}
if (generation == 500){
h = bestfitness;
}
if (generation == 600){
j = bestfitness;
}
if (generation == 700){
k = bestfitness;
}
if (generation == 800){
l = bestfitness;
}
if (generation == 900){
z = bestfitness;
}
if (generation == 500){
x = bestfitness;
}
if (generation == 1100){
c = bestfitness;
}
if (generation == 1200){
v = bestfitness;
}
if (generation == 1300){
b = bestfitness;
}
if (generation == 1400){
n = bestfitness;
}
if (generation == 1500){
m = bestfitness;
}
if (generation == 1600){
q = bestfitness;
}
if (generation == 1700){
w = bestfitness;
}
if (generation == 1800){
e = bestfitness;
}
if (generation == 1900){
r = bestfitness;
}
if (generation == 2000){
t = bestfitness;
}





}

void keyPressed()
{
  if (keyCode == UP){
framerate+=2;
}
if (keyCode == DOWN){
framerate-=2;
}
if (keyCode == 49){
framerate = 60;
}
if (keyCode == 50){
framerate = 120;
}
if (keyCode == 51){
framerate = 180;
}
if (keyCode == 52){
framerate = 240;
}
if (keyCode == 53){
framerate = 300;
}
if (keyCode == 54){
framerate = 360;
}
if (keyCode == 55){
framerate = 420;
}
if (keyCode == 56){
framerate = 480;
}
if (keyCode == 57){
framerate = 540;
}
if (keyCode == 48){
framerate = 600;
}

  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      println(a); 
      println(s);
      println(d);
      println(f);
      println(g);
      println(h);
      println(j);
      println(k);
      println(l);
      println(z);
      println(x);
      println(c);
      println(v);
      println(b);
      println(n);
      println(m);
      println(q);
      println(w);
      println(e);
      println(r);
      println(t);
    }
  }
}
//--------------------------------------------------------------------------------------------------------
