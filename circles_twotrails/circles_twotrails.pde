void setup() {
  println("width =", width);
  println("buffer =", buffer);
  println("diameter =", dia);
  println("rpath should =", (width-2*buffer-dia)/2);
  // println("rpath =", rpath);
  size(600, 600);
  noFill();
  strokeWeight(10);
  frameRate(30);
}

// Fixed Values
int Ncircles = 7;
float offset = 360/Ncircles;
float dia = 120;
float buffer = 25;
int[] colors = {#ff0000, #ffa500, #ffff00, #008000, #0000ff, #4b0082, #ee82ee};

// Hard-Coded Origin
// Redundant with translate, but helps keep math general
float Xorig = 0;
float Yorig = 0;

// Changing Values
float Xcenter;
float Ycenter;
float theta = 0;
float theta2 = 0;
float[] allXcenters = new float[2*Ncircles];
float[] allYcenters = new float[2*Ncircles];

void draw() {
  float rpath = (width-2*buffer-dia)/2;
  background(210);
  translate(width/2, height/2);
  noFill(); stroke(50,125); strokeWeight(5);
  ellipse(0,0,rpath,rpath);
  ellipse(0,0,rpath*2,rpath*2);
  
  // Trail 1: Big circles, clockwise
  theta += 2; // 4deg/Frame @ 30fps = 3s/rotation
  for (int i = 0; i < Ncircles; i++) {
    Xcenter = (rpath/2)*cos(radians(theta+i*offset))-Xorig;
    Ycenter = (rpath/2)*sin(radians(theta+i*offset))-Yorig;
    /* if (theta+i*offset >= 360 && theta+i*offset < 720) {
      Xcenter = rpath*2-Xorig;
      Ycenter = 0-Yorig;
    }
    else if (theta+i*offset > 720) {
      Xcenter = (rpath*2)*cos(radians(theta+i*offset))-Xorig;
      Ycenter = (rpath*2)*sin(radians(theta+i*offset))-Yorig;
    } */
    if (theta == 720) {
      theta = 0;
    }
    stroke(colors[Ncircles-1-i], 127); noFill();
    ellipse(Xcenter, Ycenter, dia, dia);
    noStroke(); fill(colors[Ncircles-1-i], 127);
    ellipse(Xcenter, Ycenter, 10, 10);
    allXcenters[i] = Xcenter;
    allYcenters[i] = Ycenter;
  }
    
    // Trail 2: Small circles, counter-clockwise
    theta2 -= 2; // 4deg/Frame @ 30fps = 3s/rotation
    for (int i = 0; i < Ncircles; i++) {
    Xcenter = (-rpath)*cos(radians(theta2-i*offset))-Xorig;
    Ycenter = (-rpath)*sin(radians(theta2-i*offset))-Yorig;
    /* if (theta2-i*offset <= -360 && theta2-i*offset > -720) {
      Xcenter = -rpath-Xorig;
      Ycenter = 0-Yorig;
    }
    else if (theta2-i*offset < -720) {
      Xcenter = (-rpath)*cos(radians(theta2-i*offset))-Xorig;
      Ycenter = (-rpath)*sin(radians(theta2-i*offset))-Yorig;
    } */
    if (theta2 == -720) {
      theta2 = 0;
    }
    strokeWeight(5);
    stroke(colors[i], 127); noFill();
    //println(Xcenter);
    ellipse(Xcenter, Ycenter, dia/3, dia/3);
    noStroke(); fill(colors[i], 127);
    ellipse(Xcenter, Ycenter, 10, 10);
    //println(Ycenter);
    allXcenters[2*Ncircles-1-i] = Xcenter;
    allYcenters[2*Ncircles-1-i] = Ycenter;
    stroke(colors[Ncircles-1-i], 127); strokeWeight(5);
    line(allXcenters[i],allYcenters[i],allXcenters[i+Ncircles],allYcenters[i+Ncircles]);
  }
  //noFill(); stroke(210); strokeWeight(20);
  //rect(-width/4,-height/2,width/4,height);
  //rect(-width/2,-height/;,width,height/4);
  //arc(rpath,0,0,-rpath,0,HALF_PI);
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
