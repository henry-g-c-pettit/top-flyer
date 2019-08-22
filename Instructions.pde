void instructions() {
  //used for the instruction screen
  stroke(0);
  fill(150, 200, 25);
  rect(width*0.25, height*0.25, width*0.5, height*0.5);
  fill(70, 100, 25);
  rect(width*0.71, height*0.25, width*0.04, width*0.04);
  textAlign(CENTER, CENTER);
  textSize(40);
  fill(255, 0, 0);
  text("X", width*0.732, height*0.275);
  fill(0, 0, 255);
  text("Instructions", width*0.5, height*0.28);
  fill(0);
  textSize(15);
  text("Objective is to get as many points as possible while avoiding", width*0.5, height*0.34);
  text("the floating islands. Try going through the portals to get bonuses.", width*0.5, height*0.38);
  text("Use the left and right arrow to change speed and", width*0.5, height*0.42);
  text("use the up and down arrow to fly up and down", width*0.5, height*0.46);
  text("Blue portals add 1000 points to your score:", width*0.445, height*0.52);
  text("Green portals will double your current score:", width*0.45, height*0.61);
  text("Red portals will half your current  score:", width*0.435, height*0.70);
  ellipseMode(CENTER); 
  noStroke();
  fill(0, 0, 255);
  ellipse(width*0.63, height*0.53, size*0.25, size*0.7);
  fill(0, 255, 0);
  ellipse(width*0.63, height*0.615, size*0.25, size*0.7);
  fill(255, 0, 0);
  ellipse(width*0.63, height*0.70, size*0.25, size*0.7);
}