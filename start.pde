void startScreen() {
  stroke(0);
  fill(150, 200, 25);
  rect(width/3, height/3, width/3, height/3);
  fill(0, 255, 100);
  rect(width*0.37, height*0.47, width*0.1, height/15);
  fill(0, 255, 100);
  rect(width*0.53, height*0.47, width*0.1, height/15);
  fill(0, 255, 100);
  rect(width*0.4, height*0.56, width*0.2, height/15);
  fill(0);
  textSize(26);
  textAlign(CENTER, CENTER);
  text("Start", width*0.42, height*0.50);
  text("Quit", width*0.58, height*0.50); 
  text("Instructions", width/2, height*0.59);
  fill(255, 0, 0);
  textSize(40);
  text("Top Flyer", width*0.5, height*0.39);
}