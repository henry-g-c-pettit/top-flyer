class Plane {
  float xPos;
  float yPos;
  float size;
  float defaultX;
  float defaultY;
  float gravity;
  float thrust;
  float vetVelocity=0;
  boolean up=false;
  boolean down=false;
  PImage img;
  /*
  reference to image
   Derived from http://www.flickr.com/photos/library_of_congress/2179916794/ North American's P-51 Mustang Fighter
   SHARED BY: MOHAMED IBRAHIM 09-18-2010
   */

  Plane(float x, float y, float s) {
    xPos=defaultX=x;
    yPos=defaultY=y;
    size=s;
    imageMode(CENTER);
    img = loadImage("plane.png");
  }
  void display() {
    image(img, xPos, yPos, size, size/2);
  }
  void update() {
    vetVelocity=vetVelocity+gravity;
    if (up) {
      vetVelocity+=-thrust;
    }
    if (down) {
      vetVelocity+=thrust;
    }
    yPos+=vetVelocity;
    if (yPos>height-height/20) {
      yPos=height-height/20;
      vetVelocity=0;
      gameOver();
    }
  }
  void up(boolean on) {
    up=on;
  }
  void down(boolean on) {
    down=on;
  }
  void restart() {
    xPos=defaultX;
    yPos=defaultY;
    vetVelocity=0;
  }
  boolean crashed(float objX, float objY, float objSize) { 
    float left=xPos-size/2;
    float right=xPos+size/2;
    float obLeft=objX-objSize/2;
    float obRight=objX+objSize/2;
    float top=yPos-size*0.2;
    float bottom=yPos+size*0.2;
    float obTop=objY-objSize*0.4;
    float obBottom=objY+objSize*0.4;
    float ratio=(objSize*0.25)/(objSize*0.9);
    //hitting water
    if (yPos>=height-height/20) {
      return true;
    }
    if (yPos-size/4<0) {
      return true;
    }
    //hitting island
    if (left < obRight && right > obLeft && top < obBottom && bottom > obTop) { //checks if its in the basic range of island
      if (yPos>obTop+objSize*0.1) {
        obLeft=(obLeft+objSize*0.25)-((obBottom-yPos)*ratio);
        obRight=(obRight-objSize*0.25)+((obBottom-yPos)*ratio); //resets object sides for the angled face
        if (left+size*0.3 < obRight && right-size*0.3 > obLeft && top+size*0.05 < obBottom && bottom-size*0.05 > obTop) { 
          return true; //checks again for if it could hit angled fave of island
        }
      } else {
        return true;
      }
    }
    return false;
  }
  boolean collect(float portX, float portY, float portSize) {
    //plane
    float left=xPos-size/2;
    float right=xPos+size/2;
    float top=yPos-size*0.2;
    float bottom=yPos+size*0.2;
    //portal
    float obLeft=portX-portSize/8;
    float obRight=portX+portSize/8;   
    float obTop=portY-portSize/2;
    float obBottom=portY+portSize/2;

    if (left < obRight && right > obLeft && top < obBottom && bottom > obTop) { //check if hits portal
      return true;
    }
    return false;
  }
  void difficulty(String dif) { //adjusts gravity, thrust and x position
    if(dif.equals("easy")){
      gravity=0.03;
      xPos=defaultX=width/4;
      thrust=0.25;
    } else if(dif.equals("hard")){
      gravity=0.07;
      xPos=defaultX=width/3;
      thrust=0.25;
    } else{
      gravity=0.05;
      xPos=defaultX=width/2;
      thrust=0.2;
    }
  }
}