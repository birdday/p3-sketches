// Code based on "Scribbledisks Green" by Naoki Tsutae

ArrayList Dots=new ArrayList();
float R=TWO_PI/360;

void setup() {
  size(640, 640);
  background(0);
  strokeWeight(1);
}

class Dot {
  float rad, depth;
  int status, count, gray;

  Dot() {
    depth=0;
    status=0;
    rad=random(TWO_PI);
    count=(int)random(10, 20);
    gray=(int)random(64, 255);
  }
  
  boolean update() {
    write();
    status += 10;
    depth += 0.05;
    rad += 0.03;
    return true;
  }
  
  void write() {
    //int[] choices = {0,gray};
    //int r = round(random(100) * choices.length);
    //int g = round(random(100) * choices.length);
    //int b = round(random(100) * choices.length);
    stroke(0, gray, 0);
    //fill(0,gray,0);
    pushMatrix();
    rotate(rad);
    scale(pow(1.1, depth));
    rect(100, 0, 10, 10);
    popMatrix();
  }
}

void draw() {
  fill(0, 10);
  noStroke();
  rect(0, 0, width-1, height-1);
  if (frameCount%3==0)Dots.add(new Dot());

  translate(width/2, height/2);
  for (int i=0; i<Dots.size(); i++)
    if (!((Dot)Dots.get(i)).update())Dots.remove(i);
}
