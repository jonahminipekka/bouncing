// -------------------------------------
// Globals
// -------------------------------------
ArrayList<Ball> ballArrayList;
int numberOfBallObjects = 30;
int whichBallToReplace = 1;
int score = 0;

// -------------------------------------
// Setup
// -------------------------------------
void setup() {
  size(900, 900);
  ellipseMode(RADIUS);
  createNewBallObjects();  
}

// -------------------------------------
// Create new balls
// -------------------------------------
void createNewBallObjects() {
  ballArrayList = new ArrayList<Ball>();
  for (int i = 0; i < numberOfBallObjects; i++) {
    ballArrayList.add(new Ball());
  }
}

// -------------------------------------
// Draw loop
// -------------------------------------
void draw() {
  background(100);
  fill(0);
  text("Replace index: " + whichBallToReplace, 10, 20);
  text("Score: " + score, 10, 40);

  // update balls
  for (Ball b : ballArrayList) {
    b.update();
    b.display();
  }

  // handle collisions
  for (int i = 0; i < ballArrayList.size() - 1; i++) {
    for (int j = i + 1; j < ballArrayList.size(); j++) {
      ballArrayList.get(i).makeEmBounce(ballArrayList.get(j));
    }
  }
}

// -------------------------------------
// Mouse + Key controls
// -------------------------------------
void mousePressed() {
  ballArrayList.add(new Ball(mouseX, mouseY));
}

void rotateReplace() {
  if (ballArrayList.size() > 0) {
    ballArrayList.set(whichBallToReplace % ballArrayList.size(), new Ball(mouseX, mouseY));
    whichBallToReplace++;
  }
}

void keyPressed() {
  if (key == ' ') {
    createNewBallObjects();
  }
  if (key == 'r') {
    rotateReplace();
  }
}

// -------------------------------------
// Ball class
// -------------------------------------
class Ball {
  float x, y;
  float dx, dy;
  float r;
  color c;

  Ball() {
    r = random(10, 25);
    x = random(r, width - r);
    y = random(r, height - r);
    dx = random(-3, 3);
    dy = random(-3, 3);
    c = color(random(255), random(255), random(255));
  }

  Ball(float x_, float y_) {
    r = random(10, 25);
    x = x_;
    y = y_;
    dx = random(-3, 3);
    dy = random(-3, 3);
    c = color(random(255), random(255), random(255));
  }

  void update() {
    x += dx;
    y += dy;

    // bounce off walls
    if (x < r || x > width - r) {
      dx *= -1;
    }
    if (y < r || y > height - r) {
      dy *= -1;
    }
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, r, r);
  }

  void makeEmBounce(Ball other) {
    float d = dist(x, y, other.x, other.y);
    if (d < r + other.r) {
      // simple velocity swap
      float tempDx = dx;
      float tempDy = dy;
      dx = other.dx;
      dy = other.dy;
      other.dx = tempDx;
      other.dy = tempDy;
    }
  }
}
