Pendulum p;

public void settings() {
  size(640, 360);
}

void setup() {
  
  p = new Pendulum(new PVector(width/2, 0), 175);
}

void draw() {
  background(255);
  p.go();
}

void mousePressed() {
p.clicked(mouseX,mouseY);
}

void mouseReleased() {
p.stopDragging();
}
