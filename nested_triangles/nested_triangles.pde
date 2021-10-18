int n_triangles = 10;
int triangle_count = 0;
float x1, y1, x2, y2, x3, y3;
float x1_new, y1_new, x2_new, y2_new, x3_new, y3_new;
float rotation_angle = 0;

// Setup happens once
void setup() {
  size(600, 600);
  frameRate(30);
  colorMode(HSB);
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


void draw() {
  translate(width/2, height/2);
  noStroke();
  fill(frameCount % 255, 200, 200, 1);
  rect(-width/2, -height/2, width, height);
  
  if (frameCount % 4 == 1) {
    if (triangle_count % n_triangles == 0) {
      x1 = -width/2; y1 = height/2;
      x2 = +width/2; y2 = height/2;
      x3 = 0; y3 = -height/2;
    }
    else {
      x1_new = (x1+x2)/2; y1_new = (y1+y2)/2;
      x2_new = (x2+x3)/2; y2_new = (y2+y3)/2;
      x3_new = (x3+x1)/2; y3_new = (y3+y1)/2;
      x1 = x1_new; y1 = y1_new;
      x2 = x2_new; y2 = y2_new;
      x3 = x3_new; y3 = y3_new;
    }
    noFill();
    stroke(#FFFFFF);
    rotation_angle+=PI/6;
    rotate(rotation_angle);
    //triangle(x1, y1, x2, y2, x3, y3);
    triangle_count+=1;
    float r = 600*sin(frameCount);
    circle(0, 0, r);
    rect(-0.5*r, -0.5*r, r, r);
  }
  
}

void mousePressed() {
  filter(INVERT);
}
