class Player {
  float fitness;
  Genome brain;
  boolean replay = false;

  float unadjustedFitness;
  int lifespan = 0;//how long the player lived for fitness
  int bestScore = 0;//stores the score achieved used for replay
  boolean dead;
  int score;
  int gen = 0;

  int genomeInputs = 7;
  int genomeOutputs = 4;

  float[] vision = new float[genomeInputs];//the input array fed into the neuralNet 
  float[] decision = new float[genomeOutputs]; //the out put of the NN 
  //-------------------------------------

  int size = 20;
 int velx = 0;
boolean  left2 = false;
boolean  right2 = false;

 float posx = 330;
 float posy = 389;
 
 float gravity;
 boolean db = true;
 float left = 0;
 float right = 0; 
 boolean jumping = false;
 
 int lasersdedged = 0;
 boolean resettlx = true;
 boolean resetmlx = true;
 boolean resetblx = true;
 boolean resettprx = true;
 boolean resetmrx = true;
 boolean resetbrx = true;
 
 int dbval = 0;
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  //constructor

  Player() {
    brain = new Genome(genomeInputs, genomeOutputs);
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  void draw(){
  if (posx >655){
  posx = 655;
  }
   if (posx <5){
  posx = 5;
  }
  if (left2 == true) {
    velx -=5;
  }
  if (right2 == true) {
    velx +=5;
  }  
 
  //posx += velx;
  // posx += (right - left);
   
if (posy < 389){
posy-= gravity;
gravity--;
if (posy >= 389){
gravity = 0;
posy = 389;
}
}

if (db == true){
dbval = 999999;
} else{ 
  dbval = 0;
}

lifespan();
  }
  
  //show the dino
  //this is where the dino is connected to "player" add new rects here
  void show() {
        
//background(0);
fill(200);
 rect(posx, posy, 50, 90);  }
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  
  void findodged(){
  if (posx < tlx){
    if (resettlx == true){
      resettlx = false;
    lasersdedged += 1;
      }
    }
  if (posx < mlx){
    if (resetmlx == true){
      resetmlx = false;
    lasersdedged += 1;
      }
    }
  if (posx < blx){
    if (resetblx == true){
      resetblx = false;
    lasersdedged += 1;
      }
    }
  if (posx > tprx){
    if (resettprx == true){
      resettprx = false;
    lasersdedged += 1;
      }
    }
  if (posx > mrx){
    if (resetmrx == true){
      resetmrx = false;
    lasersdedged += 1;
      }
    }
  if (posx > brx){
    if (resetbrx == true){
      resetbrx = false;
    lasersdedged += 1;
      }
    }
  }
  
  void incrementCounters() {
    lifespan++;
    if (lifespan % 3 ==0) {
      score+=1;
    }  
  }
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  //checks for collisions

void move() {
    
if (posy < 389){
posy-= gravity;
gravity--;
if (posy >= 389){
gravity = 0;
posy = 389;
}
}

//posx += (right - left);
 
 if (posx >655){
  posx = 655;
  }
   if (posx <5){
  posx = 5;
  }
  
  
  
  
if (posx < tlx + 60 && posx +50 > tlx){
if (posy < tly + 10 && posy +90 > tly){
dead = true;
}
}

if (posx < mlx + 60 && posx +50 > mlx){
if (posy < mly + 10 && posy +90 > mly){
dead = true;

}
}

if (posx < blx + 60 && posx +50 > blx){
if (posy < bly + 10 && posy +90 > bly){
dead = true;
}
}

if (posx < tprx + 60 && posx +50 > tprx){
if (posy < tpry + 10 && posy +90 > tpry){
dead = true;
}
}

if (posx < mrx + 60 && posx +50 > mrx){
if (posy < mry + 10 && posy +90 > mry){
dead = true;
}
}

if (posx < brx + 60 && posx +50 > brx){
if (posy < bry + 10 && posy +90 > bry){
dead = true;
}
}

  }
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
//what could this do????

  
  //called every frame
  void update() {
    incrementCounters();
    move();
    findodged();
  }
  //----------------------------------------------------------------------------------------------------------------------------------------------------------
  //get inputs for Neural network
  void look() {
      //x & y value for left side
    if (tlx > -100) {
      vision[0] = sqrt((((posx+25)-(tlx+30))*((posx+25)-(tlx+30))) + (((posy+45)-(tly+5))*((posy+45)-(tly+5))));
    } else {
    resettlx = true;
    vision[0] = 99999;
    }
    
    if (mlx > -100) {
      vision[1] = sqrt((((posx+25)-(mlx+30))*((posx+25)-(mlx+30))) + (((posy+45)-(mly+5))*((posy+45)-(mly+5))));
    } else {
      resetmlx = true;
    vision[1] = 99999;
    }
    
    if (blx > -100) {
      vision[2] = sqrt((((posx+25)-(blx+30))*((posx+25)-(blx+30))) + (((posy+45)-(bly+5))*((posy+45)-(bly+5))));
    } else {
      resetblx = true;
    vision[2] = 99999;
    }
    
    
  //x & y value for right side
    if (tprx < 810) {
      vision[3] = sqrt((((posx+25)-(tprx+30))*((posx+25)-(tprx+30))) + (((posy+45)-(tpry+5))*((posy+45)-(tpry+5))));
    } else {
      resettprx = true;
    vision[3] = 99999;
    }
    
    if (mrx < 810) {
      vision[4] = sqrt((((posx+25)-(mrx+30))*((posx+25)-(mrx+30))) + (((posy+45)-(mry+5))*((posy+45)-(mry+5))));
    } else {
      resetmrx = true;
    vision[4] = 99999;
    }
    
    if (brx < 810) {
      vision[5] = sqrt((((posx+25)-(brx+30))*((posx+25)-(brx+30))) + (((posy+45)-(bry+5))*((posy+45)-(bry+5))));
    } else {
      resetbrx = true;
    vision[5] = 99999;
    }
    vision[6] = dbval;
   //player x & y
  // vision[6] = posx;
   //vision[7] = posy;  
  
  }

//---------------------------------------------------------------------------------------------------------------------------------------------------------
void jump() {
 
  if (posy == 389){
  gravity = 13.5;
  posy-=gravity;
  db = true;
  }
  }
  
void doublejump() {
  if (posy < 389){
    if (db == true){
      db = false;
  gravity = 14.5;
  posy-=gravity;
}
  }
}

  //---------------------------------------------------------------------------------------------------------------------------------------------------------

  void left () {
   posx -= 5.5;
  }

  void right () {
  posx +=5.5;
  }
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  //gets the output of the brain then converts them to actions
  
  void think() {
    float max = 0; // value of biggest output
    int maxIndex = 0; // which output was the biggest
    //get the output of the neural network
    decision = brain.feedForward(vision);

    for (int i = 0; i < decision.length; i++) {
      if (decision[i] > max) {
        max = decision[i];
        maxIndex = i;
      }
    }

    switch(maxIndex) {
    case 0:
        jump();
      break;
    case 1:
       doublejump();
      break;
    case 2:
       left();
      break;
   case 3:
       right();
      break;
      
    }
  
  }
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------  
  //returns a clone of this player with the same brian
  Player clone() {
    Player clone = new Player();
    clone.brain = brain.clone();
    clone.fitness = fitness;
    clone.brain.generateNetwork(); 
    clone.gen = gen;
    clone.bestScore = score;
    return clone;
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //since there is some randomness in games sometimes when we want to replay the game we need to remove that randomness
  //this fuction does that

  Player cloneForReplay() {
    Player clone = new Player();
    clone.brain = brain.clone();
    clone.fitness = fitness;
    clone.brain.generateNetwork();
    clone.gen = gen;
    clone.bestScore = score;
    clone.replay = true;
        

    return clone;
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  //for Genetic algorithm
  void calculateFitness() {
    //fitness = score*score;
    fitness = (((lasersdedged*10)*(lasersdedged*10))+score);
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  Player crossover(Player parent2) {
    Player child = new Player();
    child.brain = brain.crossover(parent2.brain);
    child.brain.generateNetwork();
    return child;
  }
  //--------------------------------------------------------------------------------------------------------------------------------------------------------
  //if replaying then the dino has local obstacles
  
  /*
  void updateLocalObstacles() {
    localObstacleTimer ++;
    localSpeed += 0.002;
    if (localObstacleTimer > minimumTimeBetweenObstacles + localRandomAddition) {
      addLocalObstacle();
    }
    groundCounter ++;
    if (groundCounter > 10) {
      groundCounter =0;
      grounds.add(new Ground());
    }

    moveLocalObstacles();
    showLocalObstacles();
  }
  */

  //---------------------------------------------------------------------------------------------------------------------------------------------------------
 
  /*
  void moveLocalObstacles() {
    for (int i = 0; i< replayObstacles.size(); i++) {
      replayObstacles.get(i).move(localSpeed);
      if (replayObstacles.get(i).posX < -100) {
        replayObstacles.remove(i);
        i--;
      }
    }

    for (int i = 0; i< replayBirds.size(); i++) {
      replayBirds.get(i).move(localSpeed);
      if (replayBirds.get(i).posX < -100) {
        replayBirds.remove(i);
        i--;
      }
    }
    for (int i = 0; i < grounds.size(); i++) {
      grounds.get(i).move(localSpeed);
      if (grounds.get(i).posX < -100) {
        grounds.remove(i);
        i--;
      }
    }
  }
  
  */
  
  
  //------------------------------------------------------------------------------------------------------------------------------------------------------------
 
  /*
  void addLocalObstacle() {
    int tempInt = localObstacleHistory.get(historyCounter);
    localRandomAddition = localRandomAdditionHistory.get(historyCounter);
    historyCounter ++;
    if (tempInt < 3) {
      replayBirds.add(new Bird(tempInt));
    } else {
      replayObstacles.add(new Obstacle(tempInt -3));
    }
    localObstacleTimer = 0;
  }
  */
  
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
/* 
  void showLocalObstacles() {
    for (int i = 0; i< grounds.size(); i++) {
      grounds.get(i).show();
    }
    for (int i = 0; i< replayObstacles.size(); i++) {
      replayObstacles.get(i).show();
    }

    for (int i = 0; i< replayBirds.size(); i++) {
      replayBirds.get(i).show();
    }
  }
}

*/ 

void lifespan(){
  lifespan += 1;
  
  if (lasersdedged > mostdodged){
  mostdodged = bestScore;
  bestdodgedgen = gen;
  }
}
}
