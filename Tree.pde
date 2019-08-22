class Tree {
  float xPos;
  float yPos;
  float size;
  color trunk;
  color leave;
  color leaves1= color(43, 180, 30);
  color leaves2= color(75, 200, 66);
  color leaves3= color(120, 226, 34);
  color leaves4= color(13, 193, 88);
  color leaves5= color(16, 140, 5);
  color leaves6= color(73, 140, 19);
  color trunk1= color(180, 110, 30);
  color trunk2= color(140, 93, 19);
  color trunk3= color(219, 155, 54);
  color trunk4= color(219, 117, 54);
  color trunk5= color(214, 141, 17);
  color trunk6= color(132, 54, 9);
  color leaves[] = {leaves1, leaves2, leaves3, leaves4, leaves5, leaves6};
  color trunks[] = {trunk1, trunk2, trunk3, trunk4, trunk5, trunk6}; //array for multiple colours
  int treeNum;

  Tree(float x, float y, float s, int chance) {
    treeNum=chance;
    xPos=x;
    yPos=y;
    size=s;
    trunk=trunks[int(random(0, 5))];
    leave=leaves[int(random(0, 5))]; //will randomly select a color combimation and tree type
  }
  void display() {
    if (treeNum==1) { //first tree design
      noStroke();
      fill(trunk);
      quad(xPos+size*0.15, yPos+size*0.6, xPos-size*0.15, yPos+size*0.6, xPos-size*0.25, yPos+size, xPos+size*0.25, yPos+size);
      fill(leave);
      triangle(xPos, yPos-size*0.5, xPos-size*0.25, yPos-size*0.1, xPos+size*0.25, yPos-size*0.1);
      triangle(xPos, yPos-size*0.4, xPos-size*0.35, yPos+size*0.2, xPos+size*0.35, yPos+size*0.2);
      triangle(xPos, yPos-size*0.3, xPos-size*0.55, yPos+size*0.6, xPos+size*0.55, yPos+size*0.6);
    }
    if (treeNum==2) { //second tree design
      fill(trunk);
      quad(xPos+size*0.12, yPos+size*0.6, xPos-size*0.12, yPos+size*0.6, xPos-size*0.2, yPos+size, xPos+size*0.2, yPos+size);
      fill(leave);
      ellipse(xPos, yPos, size, size*0.8);
      ellipse(xPos-size*0.2, yPos+size*0.2, size/2, size/2);
      ellipse(xPos+size*0.2, yPos+size*0.3, size/2, size/2);
      ellipse(xPos, yPos+size*0.4, size/2, size/2);
    }
  }
  void update(float velocity) {
    xPos+=velocity; 
    if (xPos+size/3<0) { //resets the tree
      size=random(70, 120);
      yPos=random(0, height-height/20-size);
      xPos=width+random(0,width*1.5);
      treeNum=int(random(1, 3));
      trunk=trunks[int(random(0, 5))];
      leave=leaves[int(random(0, 5))];
    }
  }
}