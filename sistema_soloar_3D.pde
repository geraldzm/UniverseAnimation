import peasy.*;

void setup() {
  size(800, 800, P3D);
  pc = new PeasyCam(this, 200);
  //fullScreen();
  sol = new estrella(25, new PVector(0, 0, 0), 5);
}
void draw() {
  background(0);
  lights();
  sol.show();
}

PeasyCam pc;
estrella sol;
