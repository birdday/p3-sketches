// Build Canvas
size(450, 600);
background(180);

// Build Inner Canvas
//noStroke();
fill(random(255), random(255), random(255));
rect(50, 50, 350, 500);

// Lower Circle
fill(random(255), random(255), random(255));
ellipse(405, 475, 120, 120);
fill(random(255), random(255), random(255));
ellipse(150, 370, 150, 150);

//Build Recatngles
noStroke();
fill(random(255), random(255), random(255));
rect(250, 100, 80, 180);
rect(300, 80, 80, 60);

stroke(random(255), random(255), random(255));
noFill();
rect(250, 100, 80, 180);
rect(300, 80, 80, 60);

//Build Lines
stroke(random(255), random(255), random(255));
rotate(radians(-40));
translate(0, 120);
line(-500, 0, 500, 0);
translate(0, 80);
line(-500, 0, 500, 0);
translate(0, 30);
rotate(radians(-3.5));
line(-500, 0, 500, 0);
rotate(radians(3.5));
translate(0, -230);
rotate(radians(40));

// Build Lines 2
rotate(radians(60));
translate(0, 120);
line(-100, -200, 900, -200);
translate(0, 80);
line(-100, -150, 900, -150);
translate(0, 30);
rotate(radians(-3.5));
line(-100, -150, 900, -150);
rotate(radians(3.5));
translate(0, -230);
rotate(radians(-60));
