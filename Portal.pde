class Portal {
  float xPos;
  float yPos;
  float size;
  float defaultX=width*2;
  float defaultY=height*0.5;
  float defaultSize=100;
  float redSize;
  color red= color(243, 10, 10);
  color blue= color(10, 10, 255);
  color green= color(10, 255, 10);
  int redChance;
  int greenChance;
  float chance=50;
  Portal() {
    xPos=defaultX;
    yPos=defaultY;
    size=defaultSize;
  }
  void display() {
    if (chance>=redChance) {
      fill(red);
      size=redSize; //making red portals harder to avoid
    } else if (chance<redChance && chance>=greenChance) {
      fill(green);
    } else {
      fill(blue);
    }
    ellipseMode(CENTER); 
    ellipse(xPos, yPos, size*0.25, size);
  }
  void update(float horSpeed, boolean collect) {
    xPos+=horSpeed;
    if (xPos<0 || collect) { //resets portal 
      chance = random(0, 100);
      yPos=random(size/2, height*0.8);
      xPos=random(width, width*3);
      size=random(75, 150);
    }
  } 
  void restart() {
    xPos=defaultX;
    yPos=defaultY;
    size=defaultSize;
  }
  float size() {
    return size;
  }
  float xPos() {
    return xPos;
  }
  float yPos() {
    return yPos;
  }
  String type() { //return what type of portal it was
    if (chance>=90) {
      return "half";
    } else if (chance<90 && chance>=80) {
      return "double";
    } else {
      return "normal";
    }
  }
  void difficulty(String dif){ //adjusts ratio of portals appearing and red portal size
    if(dif.equals("easy")){
      redSize=150;
      redChance=95;
      greenChance=80;
    } else if(dif.equals("hard")){
      redSize=250;
      redChance=80;
      greenChance=73;
    } else{
      redSize=200;
      redChance=90;
      greenChance=80;
    }
  }
}