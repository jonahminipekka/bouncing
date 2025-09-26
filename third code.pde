Ball ball;  // our ball object

void setup() {
  size(400, 400);
  // create a ball at (200, 200) with radius 20
  ball = new Ball(200, 200, 20);
}

void draw() {
  background(255);
  ball.update(); // move & check boundaries
  ball.draw();   // display
}

// ----------------
// Ball class
// ----------------
class Ball {
  float x, y;    // position
  float vx, vy;  // velocity
  float r;       // radius
  float gravity = 0.3;
  float damping = 1;  // 1 = perfectly elastic bounce (never stops)

  // Constructor with location + size
  Ball(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.vx = 3;   // initial horizontal speed
    this.vy = 0;   // initial vertical speed
  }

  // Update position & check boundaries
  void update() {
    vy += gravity; // gravity
    x += vx;
    y += vy;

    // Bounce on floor
    if (y > height - r) {
      y = height - r;
      vy *= -damping;
    }
    // Bounce on ceiling
    if (y < r) {
      y = r;
      vy *= -damping;
    }
    // Bounce on left wall
    if (x < r) {
      x = r;
      vx *= -damping;
    }
    // Bounce on right wall
    if (x > width - r) {
      x = width - r;
      vx *= -damping;
    }
  }

  // Draw the ball
  void draw() {
    fill(0, 150, 255);
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
}
