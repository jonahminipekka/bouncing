Ball ball;

void setup() {
  size(400, 400);
  // create a ball at (200, 200) with radius 20
  ball = new Ball(200, 200, 20);
}

void draw() {
  background(255);
  ball.update(); 
  ball.draw();   
}

// ----------------
// Ball class
// ----------------
class Ball {
  float x, y;    // position
  float vx, vy;  // velocity
  float r;       // radius
  float gravity = 0.3;
  float damping = 1;  // no energy loss → infinite bounce

  Ball(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.vx = 2;   // horizontal speed
    this.vy = 0;   // vertical speed
  }

  void update() {
    vy += gravity; 
    x += vx;
    y += vy;

    // floor
    if (y > height - r) {
      y = height - r;
      vy *= -damping;
    }
    // ceiling
    if (y < r) {
      y = r;
      vy *= -damping;
    }
    // left wall
    if (x < r) {
      x = r;
      vx *= -damping;
    }
    // right wall
    if (x > width - r) {
      x = width - r;
      vx *= -damping;
    }
  }

  void draw() {
    fill(0, 150, 255);
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
}
