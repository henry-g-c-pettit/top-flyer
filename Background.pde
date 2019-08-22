class Background {
  float xPos, defaultX=width;
  float yPos, defaultY=height*0.9;
  float maxSpeed=-100;
  float size=random(height*0.2, height*0.3);
  color water = color(0, 100, 250);
  float airResitance=0.02;
  float thrust=0.07;
  float defaultSpeed=-10;
  float horVelocity=defaultSpeed;
  boolean forward=false;
  boolean back=false;
  float treeSize;
  float treeyPos;
  float treexPos;
  int numTrees=30;
  float highscore;
  Tree[] trees;
  PImage island;
  float minSize;
  float maxSize;
  float islandFrequency;
  /*
  image reference
   https://freebutterfly11.deviantart.com/art/Floating-Terrain-Mountain-01-png-and-jpeg-501600900
   by MattiaMc 
   */

  Background(float high) {
    highscore=high;
    trees = new Tree [numTrees];
    imageMode(CENTER);
    island = loadImage("floating_terrain.png");
    int index=0;
    //making all the trees
    for (int i=0; i<numTrees; i++) {
      treeSize=random(70, 120);
      treeyPos=random(0, height-height/20-treeSize);
      treexPos=random(0, width*1.5);
      int treeNum=int(random(1, 3));
      trees[index++]= new Tree(treexPos, treeyPos, treeSize, treeNum);
    }
  }

  void display() {
    noStroke();
    for (Tree tree : trees) {
      tree.update(horVelocity);
      tree.display();
    }
    image(island, xPos, yPos, size, size);
    fill(water);
    rect(0, height-height/20, width, height/20);
  }
  float update(boolean start) {
    if (!start) { //game animation
      horVelocity=horVelocity+airResitance;
      if (forward) {
        horVelocity=horVelocity-thrust;
      }
      if (back) {
        horVelocity=horVelocity+thrust;
      }
      xPos+=horVelocity;
      if (horVelocity<maxSpeed) {
        horVelocity=maxSpeed;
      }
      if (xPos<0) { //reset island
        xPos=width*2;
        yPos=random(height*0.1, height*0.9);
        size=random(minSize, maxSize);
      }
    } else { //for start animation
      xPos+=horVelocity;
      horVelocity=defaultSpeed;
      if (horVelocity<maxSpeed) {
        horVelocity=maxSpeed;
      }
    }
    return xPos;
  }
  void forward(boolean on) {
    forward=on;
  }
  void back(boolean on) {
    back=on;
  }
  void restart() { //reset to default on restart
    horVelocity=defaultSpeed;
    xPos=defaultX;
    yPos=defaultY;
  }
  float size() {
    return size;
  }
  float speed() {
    return horVelocity;
  }
  float yPos() {
    return yPos;
  }
  void difficulty(String dif) { //adjust size is islands
    if (dif.equals("easy")) {
      minSize=height*0.15;
      maxSize= height*0.25;
      islandFrequency=width+size;
    } else if (dif.equals("hard")) {
      minSize=height*0.25;
      maxSize= height*0.35;
      islandFrequency=size;
    } else {
      minSize=height*0.2;
      maxSize= height*0.3;
      islandFrequency=width/2+size;
    }
  }
}