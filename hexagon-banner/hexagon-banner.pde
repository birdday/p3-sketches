// Dynamic Sketch Practice
// Declare Variables

PImage img;
int count_draw = 0;
int count_mp = 0;
float size;
float size_hex= 100;
float xpos = 50;
float ypos = 50;
float color_val = 240;

// Setup happens once
void setup() {
  size(5000, 1000);
  strokeWeight(4);
  frameRate(60);
  background(30);
}

void drawHex(float x, float y, float gs) {
  beginShape();
  vertex(x - gs, y - sqrt(3) * gs);
  vertex(x + gs, y - sqrt(3) * gs);
  vertex(x + 2 * gs, y);
  vertex(x + gs, y + sqrt(3) * gs);
  vertex(x - gs, y + sqrt(3) * gs);
  vertex(x - 2 * gs, y);
  endShape(CLOSE);
}

// Draw continuously runs
void draw() {
  color_val = ceil(random(0,255));
  stroke(color_val);
  noFill();
  if (color_val >= 230 && color_val <= 255) {
    stroke(color(35, 178, 238));
    strokeWeight(10);
  }
  drawHex(xpos, ypos, size);
  xpos = random(0,width-1);
  ypos = random(0,height-1);
  size = size_hex + random(-3,3);
  strokeWeight(4);
  
  count_draw += 1;
  if (count_draw >= 100) {
    count_draw = 0;
    background(30);
  }
}

// Happens on event
void mousePressed() {
  count_mp += 1;
  save("hex"+str(count_mp)+".png");
}

void keyPressed() {
  size_hex = size_hex - 5;
  if (size_hex <= 0) {
    size_hex = 50;
  }
}
