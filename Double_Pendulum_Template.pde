float r1 = 200;
float r2 = 200;
float m1 = 40;
float m2 = 40;
float a1 = 0;
float a2 = 0;
float a1_v = 0;
float a2_v = 0;
float a1_a = 0.001;
float a2_a = -0.003;

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
  
  
  canvas.beginDraw();
  canvas.translate(300, 50);
  canvas.strokeWeight(4);
  canvas.stroke(0);
  canvas.point(x2,y2);
  canvas.endDraw();
  
}
