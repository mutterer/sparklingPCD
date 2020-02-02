class bubble {
  float x, y, z, radius;

  bubble (float x, float y, float z, float radius) {
    this.x=x;
    this.y=y;
    this.z=z;
    this.radius=radius;
  }
  void display(color col) {
    pushMatrix();
    translate(x, y, z);
    fill (col);
    sphereDetail(6);
    sphere(radius);
    popMatrix();
  }
  void move() {
    y = y - radius * 0.4;
    if (y < -height/2 ) y = height/2-1;
    z=z*(cos(roty*0.1));
  }
}
