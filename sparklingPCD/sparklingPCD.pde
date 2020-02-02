int n;
bubble[] bubbles;
float rotx = 0;
float roty = -PI/2;
float rotz = 0;
float zoom = 0.8;
float x, y, z;
PGraphics pg;
PFont f;

void setup() {
  size(512, 512, P3D);
  frameRate(60);
  n = 2000;
  bubbles = new bubble[n];
  for (int i = 0; i < n; i++ ) {
    x = random(width)-width/2;
    y = random(height)-height/2;
    z = random(255)-128;
    bubbles[i] = new bubble(x, y, z, 1+random(4));
  }
  pg = createGraphics(512, 512);
  pg.beginDraw();
  pg.background(0);
  pg.fill(255);
  pg.textSize(200);
  pg.textAlign(CENTER, CENTER);
  pg.text("#PCD", width/2, height/3);
  pg.text("2020", width/2, 2*height/3);
  pg.endDraw();
}

void draw() {
  background(0);
  ambientLight(100, 100, 200);
  directionalLight(255, 255, 0, 1, -1, 0);
  translate (width/2, height/2);
  rotateX(rotx);
  rotateY(roty);
  if (roty<0) roty+=0.005;
  rotateZ(rotz);
  scale(zoom);
  noStroke();
  for (int i = 0; i < n; i++ ) {
    bubbles[i].move();
    if (pg.get(int(bubbles[i].x+width/2), int(bubbles[i].y+height/2))!=color(0))  
      bubbles[i].display(color(255, 255, 100));
  }
}

void mouseDragged() {
  float rate = 0.01;
  rotx -= (pmouseY-mouseY) * rate;
  roty += (pmouseX-mouseX) * rate;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom = zoom+0.001*e;
}
