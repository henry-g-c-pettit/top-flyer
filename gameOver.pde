void endGame(float point, float high) {
  stroke(0);
  float points=point;
  float highscore=high;
  fill(150, 200, 25);
  rect(width/3, height/3, width/3, height/3);
  fill(0, 255, 100);
  rect(width*0.37, height*0.45, width*0.1, height/15);
  fill(0, 255, 100);
  rect(width*0.53, height*0.45, width*0.1, height/15);
  fill(0);
  textSize(26);
  textAlign(CENTER, CENTER);
  text("Retry", width*0.42, height*0.48);
  text("Quit", width*0.58, height*0.48); 
  text("Score : "+(points), width*0.5, height*0.55);
  text("Highscore : "+(highscore), width*0.5, height*0.62);
  fill(255, 0, 0);
  textSize(40);
  text("Game Over", width*0.5, height*0.39);
}
//mouse interface
void mouseClicked() {
  if (gameOver) {
    if (mouseX>width*0.37&&mouseX<width*0.47&&mouseY>height*0.45&&mouseY<height*0.48+height/15) {
      restart();
    }
    if (mouseX>width*0.53&&mouseX<width*0.63&&mouseY>height*0.45&&mouseY<height*0.48+height/15) {
      quit();
    }
  }
  if (start) {
    if (mouseX>width*0.37&&mouseX<width*0.47&&mouseY>height*0.48&&mouseY<height*0.48+height/15) {
      choose=true;
    }
    if (mouseX>width*0.53&&mouseX<width*0.63&&mouseY>height*0.48&&mouseY<height*0.48+height/15) {
      quit();
    }
    if (mouseX>width*0.4&&mouseX<width*0.6&&mouseY>height*0.56&&mouseY<height*0.56+height/15) {
      instructions=true;
    }
  }
  if (instructions) {
    if (mouseX>width*0.71&&mouseX<width*0.75&&mouseY>height*0.25&&mouseY<height*0.25+width*0.04) {
      instructions=false;
    }
  }
  if(choose){
    if (mouseX>width*0.33&&mouseX<width*0.43&&mouseY>height*0.51&&mouseY<height*0.51+height/15) {
      difficulty="easy";
      choose=false;
      start=false;
    }
    if (mouseX>width*0.45&&mouseX<width*0.55&&mouseY>height*0.51&&mouseY<height*0.51+height/15) {
      difficulty="normal";
      choose=false;
      start=false;

    }
    if (mouseX>width*0.57&&mouseX<width*0.67&&mouseY>height*0.51&&mouseY<height*0.51+height/15) {
      difficulty="hard";
      choose=false;
      start=false;
    }    
  }
}
void mouseReleased() {
  if (gameOver) {
    if (mouseX>width*0.37&&mouseX<width*0.47&&mouseY>height*0.48&&mouseY<height*0.48+height/15) {
      restart();
    }
    if (mouseX>width*0.53&&mouseX<width*0.63&&mouseY>height*0.48&&mouseY<height*0.48+height/15) {
      quit();
    }
  }
  if (start) {
    if (mouseX>width*0.37&&mouseX<width*0.47&&mouseY>height*0.47&&mouseY<height*0.47+height/15) {
      choose=true;
    }
    if (mouseX>width*0.53&&mouseX<width*0.63&&mouseY>height*0.47&&mouseY<height*0.47+height/15) {
      quit();
    }
    if (mouseX>width*0.4&&mouseX<width*0.6&&mouseY>height*0.56&&mouseY<height*0.56+height/15) {
      instructions=true;
    }
  }
  if (instructions) {
    if (mouseX>width*0.71&&mouseX<width*0.75&&mouseY>height*0.25&&mouseY<height*0.25+width*0.04) {
      instructions=false;
    }
  }
  if(choose){
    if (mouseX>width*0.33&&mouseX<width*0.43&&mouseY>height*0.51&&mouseY<height*0.51+height/15) {
      difficulty="easy";
      choose=false;
      start=false;
    }
    if (mouseX>width*0.445&&mouseX<width*0.545&&mouseY>height*0.51&&mouseY<height*0.51+height/15) {
      difficulty="normal";
      choose=false;
      start=false;
    }
    if (mouseX>width*0.57&&mouseX<width*0.67&&mouseY>height*0.51&&mouseY<height*0.51+height/15) {
      difficulty="hard";
      choose=false;
      start=false;
    }    
  }
}
void restart() { //restarts the game
  gameOver=false;
  finalPoints=0;
  point=0;
  portal.restart();
  plane.restart();
  backDrop.restart();
}
void quit() {
  exit();
}