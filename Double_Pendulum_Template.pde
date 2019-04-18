float r1 = 200;
float r2 = 200;
float m1 = 40;
float m2 = 60;
double a1 = 0;
double a2 = PI - 0.0001;
double a1_v = 0;
double a2_v = 0;
double a1_a = 0;
double a2_a = 0;
float gravity = 0.13;
float damp = 0.998;

PGraphics canvas;

void setup() {
  size(600,600);
  canvas = createGraphics(600, 600);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw() {
  //background(255);
  image(canvas,0,0);
  stroke(0);
  strokeWeight(2);
  
  
  translate(300, 50);
  
  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);
  
  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);
  
  
  line(0,0,x1,y1);
  fill(0);
  ellipse(x1,y1,m1,m1);
  
  line(x1,y1,x2,y2);
  fill(0);
  ellipse(x2,y2,m2,m2);
  
  
  a1 += a1_v;
  a2 += a2_v;
  a1_v += a1_a;
  a2_v += a2_a;
  
  
  a1_a = (-1 * gravity * (2 * (m1 + m2)) * sin(a1) - m2 * gravity * sin(a1 - (2 * a2)) - 2 * sin(a1 - a2) * m2 * (pow(a2_v,2) * r2 + pow(a1_v,2) * r1 * cos(a1 - a2))) / (r1 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2)));
  a2_a = (2 * sin(a1 - a2) * (pow(a1_v,2) * r1 * (m1 + m2) + gravity * (m1 + m2) * cos(a1) + pow(a2_v,2) * r2 * m2 * cos(a1-a2))) / (r2 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2)));
  //a1_v *= damp;
  //a2_v *= damp;
  
  print(a1_a, "  --------  ", a2_a, "\n");
  
  canvas.beginDraw();
  canvas.translate(300, 50);
  canvas.strokeWeight(4);
  canvas.stroke(0);
  canvas.point(x2,y2);
  canvas.endDraw();
  
}
