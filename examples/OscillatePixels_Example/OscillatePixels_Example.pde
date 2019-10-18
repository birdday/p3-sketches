// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 20;
int rows = 20;
int spanX = 400;
int spanY = 400;


void setup() {
  size(400,400);
  int spaceX = width/cols;
  int spaceY = height/rows;
  // Can't use vars for the size command, but build variables anyways
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*spaceX,j*spaceY,spaceX,spaceY,i+j);
    }
  }
}

void draw() {
  background(0);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      if (mousePressed) {
        grid[i][j].oscillate();
        grid[i][j].display();
      } else {
        grid[i][j].display();
      }
    }
  }
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  // Oscillation means increase angle
  void oscillate() {
    angle += 0.5; 
  }

  void display() {
    int a1 = 255;
    stroke(a1*sin(angle),a1*sin(angle),a1*sin(angle));
    // Color calculated using sine wave
    fill(a1*sin(angle),a1*sin(angle),a1*sin(angle));
    rect(x,y,w,h); 
  }
}
