float r1 = 200;
float r2 = 200;
float m1 = 40;
float m2 = 40;
float a1 = PI/2;
float a2 = PI/2;
float a1_v = 0;
float a2_v = 0;
float a1_a = 0;
float a2_a = 0;
float gravity = .15;
float damp = 0.999;

float px2 = -1;
float py2 = -1;
float cx, cy;

float t = 0;
float v = 0;
float totE = 0;

PGraphics canvas;

void setup() {
  
  // canvas setup
  size(900,600);
  cx = width/2;
  cy = 50;
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
  
  frameRate(120);
}

void draw() {
  
  // equations for angular acceleration of both pendulums
  a1_a = (-1 * gravity * (2 * (m1 + m2)) * sin(a1) - m2 * gravity * sin(a1 - (2 * a2)) - 2 * sin(a1 - a2) * m2 * (pow(a2_v,2) * r2 + pow(a1_v,2) * r1 * cos(a1 - a2))) / (r1 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2)));
  a2_a = (2 * sin(a1 - a2) * (pow(a1_v,2) * r1 * (m1 + m2) + gravity * (m1 + m2) * cos(a1) + pow(a2_v,2) * r2 * m2 * cos(a1-a2))) / (r2 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2)));
  
  
  
  
  //background(255);
  image(canvas,0,0);
  stroke(0);
  strokeWeight(2);
  
  
  translate(cx, cy);
  
  // changing position of pendulums
  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);
  
  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);
  
  // creates lines between pendulums
  line(0,0,x1,y1);
  fill(0);
  ellipse(x1,y1,m1,m1);
  
  line(x1,y1,x2,y2);
  fill(0);
  ellipse(x2,y2,m2,m2);
  
  // updates angular velocity and position *ORDER IMPORTANT*
  a2_v += a2_a;
  a1_v += a1_a;
  a2 += a2_v;
  a1 += a1_v;
  
  
  //a1_v *= damp;
  //a2_v *= damp;
  
  
  //Center Line - Used to track increase in energy
  line(-450, 0, 450, 0);
  float cM = y1 + (r2 / 2) * cos(a2);
  line(-450, cM, 450, cM);
  print(cM, "\n");
  
  
  // calculates total energy of system
  t = 0.5 * m1 * pow(a1_v,2) + 0.5 * m2 * pow(a2_v,2);
  v = -1 * m1 * gravity * y1 + m2 * gravity * y2;
  totE = t + v;
  
  //print(totE, "\n");
  
  // implements canvas and tracking lines
  canvas.beginDraw();
  canvas.translate(cx, cy);
  canvas.strokeWeight(4);
  canvas.stroke(0);
  if (frameCount > 1) {
    canvas.line(px2, py2, x2,y2);
  }
  canvas.endDraw();
  
  // saves last position of pendulums to create tracking lines
  px2 = x2;
  py2 = y2;
  
}
