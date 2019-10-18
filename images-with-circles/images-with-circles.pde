// Dynamic Sketch Practice
// Declare Variables

PImage img;
int count = 0;
float size;
float size_o = 51;
float circleX = 50;
float circleY = 50;
int canvas_size = 600;

// Setup happens once
void setup() {
  size(600, 600); //size() cannot take in variables
  frameRate(60);
  img = loadImage("LadyGaga-Joanne.jpg");
  img.resize(0,canvas_size);
  //image(img,0,0);
  background(30);
}

// Draw continuously runs

void draw() {
  noStroke();
  int loc = Math.round(circleX)+Math.round(circleY)*width;
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);    
  float rand = Math.round(random(-25,25));
  fill(r+rand,g+rand,b+rand);
  ellipse(circleX, circleY, size, size);
  circleX = random(0,width-1);
  circleY = random(0,height-1);
  size = size_o + random(-3,3);
}

// Happens on event
void mousePressed() {
  // Apply Image Filter
  /*
  int[] filtertypes = {GRAY, INVERT};
  int appliedfilter = filtertypes[Math.round(random(-0.4999,1.4999))];
  filter(appliedfilter);
  */
  // Load New Image
  if (count == 0) {
    img = loadImage("florence-what-kind-of-man.jpg");
    img.resize(0,canvas_size);
    println(count);
  }
  if (count == 1) {
    img = loadImage("LadyGaga-Joanne.jpg");
    img.resize(0,canvas_size);
    println(count);
  }
  if (count == 1) {
    img = loadImage("CharliePic.png");
    img.resize(0,canvas_size);
    println(count);
  }
  count = count + 1;
  if (count >= 3) {
    count = 0;
  }
}

void keyPressed() {
  size_o = size_o - 5;
  if (size_o <= 0) {
    size_o = 50;
  }
}
