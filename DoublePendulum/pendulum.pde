float g = 1;

float m1 = 40;
float m2 = 40;

float a1 = PI/2;
float a2 = PI/2;

float l1 = 200;
float l2 = 200;

float x1, y1;
float x2, y2;

float a1_a = 0;
float a2_a = 0;

float a1_v = 0;
float a2_v = 0;

float prev_x = 0;
float prev_y = 0;

PGraphics cv;

void setup() 
{
  size(900,700);
  cv = createGraphics(width, height);
}

void draw()
{
  background(255);
  image(cv, 0, 0);
  
  translate(width/2, 200);
  
  x1 = l1 * sin(a1);
  y1 = l1 * cos(a1);
  
  x2 = x1 + l2 * sin(a2);
  y2 = y1 + l2 * cos(a2);
  
  cv.beginDraw();
  
  cv.translate(width/2, 200);
  
  cv.stroke(20);
  cv.strokeWeight(1);
  
  if (frameCount > 1) { 
    cv.line(prev_x, prev_y, x2, y2);
  }
  
  cv.endDraw();
  
  stroke(0);
  fill(0);
  strokeWeight(2);
  
  line(0, 0, x1, y1);
  ellipse(x1, y1, m1, m1);
  
  line(x1, y1, x2, y2);
  ellipse(x2, y2, m2, m2);
  
  a1_a =  -1*g*(2*m1+m2)*sin(a1);
  a1_a += -1*m2*g*sin(a1 - 2*a2);
  a1_a += -2*sin(a1-a2)*m2*(a2_v*a2_v*l2+a1_v*a1_v*l1*cos(a1-a2));
  a1_a /= l1*(2*m1+m2-m2*cos(2*a1-2*a2));
  
  a2_a =  2*sin(a1-a2)*(a1_v*a1_v*l1*(m1+m2)+g*(m1+m2)*cos(a1)+a2_v*a2_v*l2*m2*cos(a1-a2));
  a2_a /= l2*(2*m1+m2-m2*cos(2*a1-2*a2));
  
  a1_v += a1_a;
  a2_v += a2_a;
  
  a1 += a1_v;
  a2 += a2_v;
  
  prev_x = x2;
  prev_y = y2;
}
