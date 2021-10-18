// Fixed Values
int Ncircles = 7;
float offset = 360/Ncircles;
float dia = 150;
float buffer = 25;
float rpath = (width-2*buffer-dia)/2;
int[] colors = {#ff0000, #ffa500, #ffff00, #008000, #0000ff, #4b0082, #ee82ee};

// Hard-Coded Origin
// Redundant with translate, but helps keep math general
float Xorig = 0;
float Yorig = 0;

// Changing Values
float Xcenter;
float Ycenter;
float theta = 0;

void setup() {
  size(600, 600);
  noFill();
  strokeWeight(10);
  frameRate(30);
}

void draw() {
  background(210);
  translate(width/2, height/2);
  theta += 4; // 4deg/Frame @ 30fps = 3s/frame, 1 second rest => 120 deg

  for (int i = 0; i < Ncircles; i++) {
    Xcenter = (rpath*2)*cos(radians(theta+i*offset))-Xorig;
    Ycenter = (rpath*2)*sin(radians(theta+i*offset))-Yorig;
    if (theta+i*offset >= 360 && theta+i*offset < 720) {
      Xcenter = rpath*2-Xorig;
      Ycenter = 0-Yorig;
    }
    else if (theta+i*offset > 720) {
      Xcenter = (rpath*2)*cos(radians(theta+i*offset))-Xorig;
      Ycenter = (rpath*2)*sin(radians(theta+i*offset))-Yorig;
    }
    if (theta == 720) {
      theta = 0;
    }
    
    noFill();
    stroke(colors[Ncircles-1-i], 127);
    ellipse(Xcenter, Ycenter, dia, dia);
  }
  resetMatrix();
  noise();
}

void mousePressed() { 
  looping = !looping;
  filter(INVERT);
}

void noise() {
  noStroke();
  for (int i = 0; i < width - 1; i += 5) {
    for (int j = 0; j < height - 1; j += 5) {
      fill(random(0, 150), random(0, 20));
      rect(random(i - 5, i), random(j - 5, j), 1, 1);
    }
  }
  for (int i = 0; i < 10; i++) {
    fill(random(0, 255), random(0, 200));
    rect(random(0, width), random(0, height), random(1, 3), random(1, 3));
  }
}
