void difficulty() {
  stroke(0);
  fill(150, 200, 25);
  rect(width*0.3, height/3, width*0.4, height/3);
  fill(0, 255, 100);
  rect(width*0.33, height*0.51, width*0.1, height/15);
  fill(0, 255, 100);
  rect(width*0.45, height*0.51, width*0.1, height/15);
  fill(0, 255, 100);
  rect(width*0.57, height*0.51, width*0.1, height/15);
  fill(0);
  textSize(26);
  textAlign(CENTER, CENTER);
  text("Easy", width*0.38, height*0.54);
  text("Normal", width*0.5, height*0.54); 
  text("Hard", width*.62, height*0.54);
  fill(255, 0, 0);
  textSize(40);
  text("Choose difficulty", width*0.5, height*0.39);
}