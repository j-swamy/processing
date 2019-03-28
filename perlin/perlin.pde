import processing.pdf.*;

float detail =    0.6;      // amount of detail in the noise (0-1)
float increment = 0.02;    // how quickly to move through noise (0-1) 

//initializing variables to be used throughout code
//coordinates and dimensions of perlin squares
int x = 500;
int y = 300;
int w = 100;
int l = 300;
//random rgb values to be decided in makeColor()
float r = 0;
float g = 0;
float b = 0;
//probability to influence colors
float prob = 0;


void setup() {  
  size(1152, 720);
  background(240);
  
  noFill();
  stroke(40, 100);
  noStroke();
  
  //deciding random color of background
  makeColor();
  
  //calling background gadient method
  backGradient(r, g, b);
  
  //decide color palette of perlin noise in squares
  makeColor();
  
  int num = int(random(10, 20));
  for (int i = 0; i < num; i++) {
    //initialize coordinates and size of perlin noise squares
    x = int(random(0, 1150));
    y = int(random(0, 700));
    w = int(random(100, 400));
    //l = int(random(100, 400));
    //actually making perlin noise
    perlin(x, y, w, w);
    noFill();
    //border for perlin noise squares
    strokeWeight(10);
    rect(x, y, w, w);
  }
  


  save("perlin.png");

}

//setting color of perlin noise-- prob used to determine where gray variable will be in stroke
void setColor(float gray, float r, float g, float b, float prob) {
  if (prob < 0.3) {
      stroke(gray, g, b);
    }
  else if (prob > 0.6) {
      stroke(r, gray, b);
    }
    else if (prob >= 0.3 && prob <= 0.6) {
      stroke(r, g, gray);
    }
}

//generate random colors
//prob variable to be used in setColor()
void makeColor() {
  r = random(255);
  g = random(255);
  b = random(255);
  prob = random(1);
}


void perlin(int xc, int yc, int w, int l) {
     //generating random colors to be used in perlin noise
  
  
  // set each pixel onscreen from noise()
  for (int x = xc; x < xc + w; x++) {
    for (int y = yc; y < yc + l; y++) {
      float gray = noise(x*increment, y*increment) * 255;
      setColor(gray, r, g, b, prob);
      //stroke(r, gray, b);
      // set the current pixel to the value from noise()
      point(x, y);
      
    }
  }
  
  setColor(15, r, g, b, prob);
  
}

void backGradient(float r, float g, float b)
{
    //creating colors based on randomly generated rgb values
    color c1 = color(r, g, b);
    //making a slight difference in color so the gradient looks nice
    color c2 = color(r - 100, g - 100, b + 100);
      // Top to bottom gradient
      for (int i = 0; i <= height; i++){
        //making gradient by drawing lines using lerpColor
        float inter = map(i, 0, height, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(0, i, width, i);
      }
}
