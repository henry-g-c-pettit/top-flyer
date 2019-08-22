//feilds
Portal portal;
Plane plane;
Background backDrop;
boolean gameOver=false;
boolean crashed=false;
boolean start=true;
boolean collect=false;
boolean instructions=false;
boolean choose=false;
String difficulty="normal";
float size=70;
float finalPoints=0;
float point=0;
float highscore=0;
void setup() {
  size(1000, 600);
  background(250);
  backDrop =  new Background(highscore);
  portal =  new Portal();
  plane =  new Plane(width/4, height/2, size);
}
void draw() {
  background(140, 239, 98);
  if (!start) { //game is started
    plane.difficulty(difficulty);
    backDrop.difficulty(difficulty);
    portal.difficulty(difficulty);
    if (!gameOver) { //for if game is still going
      //variables used to pass into plane and portal
      float objectX=backDrop.update(start);
      float objectSize=backDrop.size();
      float portalX=portal.xPos();
      float portalY=portal.yPos();
      float portalSize=portal.size();
      float objectY=backDrop.yPos();
      float horSpeed= backDrop.speed();
      //basic updates
      point-=horSpeed;      
      plane.update();
      backDrop.display();      
      plane.display();
      crashed=plane.crashed(objectX, objectY, objectSize); //check crash
      collect=plane.collect(portalX, portalY, portalSize); //check if hit portal
      point=points(); //update score
      portal.update(horSpeed, collect);
      portal.display();
      fill(255, 0, 0);
      //current speed and points displayed at top of screen
      textSize(30);
      text("Speed: "+int(horSpeed*-1), width*0.3, 25);
      text("Score: "+int(point), width*0.67, 25);
    } else {
      backDrop.update(start);
      backDrop.display();
      endGame(finalPoints, highscore); //game over
    }
    if (crashed) {
      gameOver(); //they crashed
    }
  } else {// start animation
    backDrop.update(start);
    backDrop.display();
    if (choose) { //choosing difficulty
      difficulty();
    } else if (instructions) { //the instructions
      instructions();
    } else { //normal start screen
      startScreen();
    }
  }
}

//botton interface
void keyPressed() {
  if (keyCode==UP) {
    plane.up(true);
  }
  if (keyCode==DOWN) {
    plane.down(true);
  }
  if (keyCode==LEFT) {
    backDrop.back(true);
  }
  if (keyCode==RIGHT) {        
    backDrop.forward(true);
  }
}
void keyReleased() {
  if (keyCode==UP) {
    plane.up(false);
  }
  if (keyCode==DOWN) {
    plane.down(false);
  }
  if (keyCode==LEFT) {
    backDrop.back(false);
  }
  if (keyCode==RIGHT) {        
    backDrop.forward(false);
  }
}
//called when it's game over
void gameOver() {
  finalPoints=point;
  gameOver=true;
  collect=false;
  if (highscore<finalPoints) {
    highscore=finalPoints; //set highscore
  }
  endGame(finalPoints, highscore); //call end game screen and method
}