/*
* Jyotsna Ramaswamy
*/

color[] border = {color(218, 194, 154), color(165, 134, 104), color(105, 82, 52)};
color[] gradient = {color(223, 255, 255), color(185, 255, 251), color(164, 250, 250), color(134, 240, 255), color(119, 238, 255), color(102, 236, 255), color(77, 214, 255), color(22, 214, 255)};
int gridSize = 100;

void setup() {
  size(800, 800);
  background(255);
  int gc = 0; //gradient color counter
  for (int y = 0; y <= height; y += gridSize) {
    for (int x = 0; x <= width; x += gridSize/2){
      pushMatrix();
      translate(x,y);
      noStroke();
      fill(gradient[gc]);
      rect(0,0,gridSize, gridSize);
      if ((y % 100 == 0) && gc < gradient.length-1) {
        gc += 1;
      }
      else {
        gc = 0;
      }
     
      if (x % 4 == 0) {
        noStroke();
        fill(255, 238, 246);
        //triangle(0,0, gridSize,0, gridSize/2,gridSize/2);
        triangle(0,gridSize/2, 0, gridSize, gridSize/2, 0);
        fill(255);
        circle(gridSize/2-17, gridSize/2+20, 20);
        fill(254, 255, 238);
        triangle(0,0, 0, gridSize/4, gridSize/4, 0);

      }
      
      else if (x % 5 == 0) {
        noStroke();
        fill(20, 238, 246);
        //triangle(0,0, gridSize,0, gridSize/2,gridSize/2);
        triangle(gridSize/2,gridSize/2, gridSize/2, gridSize, 0, 0);
        fill(255);
        circle(gridSize/2-33, gridSize/2+20, 20);
        fill(254, 255, 238);
        triangle(gridSize, 0, gridSize/4, 0, gridSize, gridSize/4+47);
      }
      
       popMatrix();
    }
  }
  
  makeBorder();
  
  save("Ramaswamy_Jyotsna_QUILT.png");
}

void makeBorder() {
  noStroke();
  int cc = 0; //referring to colors in border array; colors will alternate
  
  //top and bottom border
  for (int x = 0; x <= width; x += gridSize/4){
    fill(border[cc]);
    rect(x, 0, gridSize/4, gridSize/4);
    rect(x, height-gridSize/4, gridSize/4, gridSize/4);
    if (cc == border.length-1) {
      cc = 0;
    }
    else {
      cc += 1;
    }  
  }
  
  cc = 0;
  //right and left borders
  for (int y = 0; y <= height; y+= gridSize/4) {
    fill(border[cc]);
    rect(0, y, gridSize/4, gridSize/4);
    rect(width-gridSize/4, y, gridSize/4, gridSize/4);
    if (cc == border.length-1) {
      cc = 0;
    }
    else {
      cc += 1;
    } 
  }
}
