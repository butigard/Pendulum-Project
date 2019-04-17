


class Pendulum {
  PVector position;
  PVector origin;
  float r;
  float angle;
  float aVel;
  float aAcc;
  float ballr;
  float damping;
  float grav;
  
  boolean dragging = false;
  
  
  Pendulum(PVector origin_, float r_) {
    origin = origin_;
    position = new PVector();
    r = r_;
    angle = PI/4;
    
    aVel = 0;
    aAcc = 0;
    damping = 0.995;
    ballr = 48.0;
    
  }
  
  void go() {
    update();
    drag();
    display();
  }
  
  void update() {
    if(!dragging) {
      grav = 0.4;
      aAcc = (-1 * grav / r) * sin(angle);
      aVel += aAcc;
      angle += aVel;
    }
  }
  
  void display() {
    position.set(r*sin(angle), r*cos(angle), 0);
    position.add(origin);
    stroke(0);
    strokeWeight(2);
    // Draw the arm
    line(origin.x, origin.y, position.x, position.y);
    ellipseMode(CENTER);
    fill(175);
    if (dragging) fill(0);
    // Draw the ball
    ellipse(position.x, position.y, ballr, ballr);
  }
  
  void clicked(int mx, int my) {
    float d = dist(mx, my, position.x, position.y);
    if (d < ballr) {
      dragging = true;
    }
  }

    void stopDragging() {
    if (dragging) {
      aVel = 0;
      dragging = false;
    }
  }
  
  void drag() {
    if (dragging) {
      PVector diff = PVector.sub(origin, new PVector(mouseX, mouseY));
      angle = atan2(-1 * diff.y, diff.x) - radians(90);
    }
  }
  
}
