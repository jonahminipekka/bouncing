float x = 200;
float y = 200;
float vy = 2;   // vertical speed
float gravity = 0.2;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  
  // move ball
  vy += gravity; 
  y += vy;
  
  // bounce off floor
  if (y > height-20) {
    y = height-20;
    vy *= -0.8; // reverse + lose a little speed
  }
  
  // draw ball
  fill(0, 150, 255);
  ellipse(x, y, 40, 40);
}
