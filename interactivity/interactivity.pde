

int id = 1; //id for which shape will be drawn; 1-square, 2-circle, 3-triangle
int saveCount = 0; //count how many saves have happened (for naming purposes)

//square data
int sSize = 150; 
boolean sLock, sDrag = false; //for dragging/trailing square
int xs = 100;
int ys = 300;
//circle data
int cSize = 150;
boolean cLock, cDrag = false; //for dragging/trailing circle
int xc = 600;
int yc = 370;
//triangle data
int tx1 = 300;
int ty1 = 375;
int tx2 = 375;
int ty2 = 200;
int tx3 = 450;
int ty3 = 375;
boolean tLock,tDrag = false; //for dragging/trailing triangle
//color palette for project
color [][] palette = {{color(130,138,149), color(246,250,255)}, {color(213, 201, 223), color(214, 159, 255)}, {color(206,234,247), color(156,223,255)}, {color(231, 207, 205), color(154, 127, 124)}, {color(185,227,198), color(83, 108, 91)}, {color(220, 184, 203), color(255, 152, 208)}};
//palette index tracker
int pindex = 0;


void setup() {
  size(800, 800);
  background(0); //initial bg
                     
}


void draw() {
  color c1 = palette[pindex][0]; //lerp color part 1
  color c2 = palette[pindex][1]; //lerp color part 2
  float pos = map(mouseX*mouseY, 0,width*height, 0,1);
  stroke(lerpColor(c1,c2,pos)); //shape outline
  noFill();  
  //shapes
  square(xs,ys, sSize);
  circle(xc, yc, cSize);
  triangle(tx1,ty1,tx2,ty2,tx3,ty3);
  shapeRelease(id); //depending on which key is pressed, that shape will be used for drawing.

}



void mousePressed() {
  //following conditions are for which shape will be used to draw with
  if (sLock) {
    sDrag = true;
  }
  
  else if (cLock) {
    cDrag = true;
  }
  
  else if (tLock) {
    tDrag = true;
  }
    
}

void mouseDragged() {
  //how shape will change in size/position when dragged across the canvas
  if (sDrag) {
    xs = mouseX;
    ys = mouseY;
    sSize = mouseX - 400;
  }
  
  else if (cDrag) {
    xc = mouseX;
    yc = mouseY;
    cSize = mouseX - 400;
  }
  else if (tDrag) {
    tx1 = mouseX - 75;
    ty1 = mouseY + 175;
    tx2 = mouseX;
    ty2 = mouseY;
    tx3 = mouseX + 75;
    ty3 = mouseY + 175;
    
  }
}

void mouseReleased() {
  //set all dragging booleans to false
  sDrag = false;
  cDrag = false;
  tDrag = false;
  
}

void shapeRelease(int id) {
  //which shape will we be drawing with based on key pressed
  if (id == 1) {
    //square
      sLock = true;
      cLock = false;
      tLock = false;
  }
  
  if (id == 2) {
    //circle
   sLock = false;
   cLock = true;
   tLock = false;
  }
  
  if (id == 3) {
    //triangle
   sLock = false;
   cLock = false;
   tLock = true;
  }
  
  

}


void keyPressed() {
  if (key == 115) {
    //press 's' to save -- multiple files can be saved with 00_ naming convention.
    saveCount++;
    String filename = "still" + nf(saveCount, 3) + ".png";
    save(filename);
  }
  //following conditionals allow user to select which shape they want to draw with
  if (key == 49) {
    id = 1;
  }
  
  if (key == 50) {
    id = 2;
  }
  
  if (key == 51) {
    id = 3;
  }
  //press 'c' to change the color of shape outlines (based on colors in palette)
  if (key == 99) {
    if (pindex == palette.length-1) {
      pindex = 0;
    }
    else {
      pindex += 1;
    }
  }
  
  //clear background, will get a random dark canvas to draw on
  if (key == BACKSPACE) {
    background(random(70));
  }
}
