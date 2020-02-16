import peasy.*;

void setup() {
  size(920, 800, P3D);
  pc = new PeasyCam(this, 200);
  //fullScreen();
  sol = new estrella(25, new PVector(0, 0, 0), 5);
  backgroundImage = loadImage("space.jpg");
  backgroundImage.resize(920,800);
}
void draw() {
  background(backgroundImage);
  lights();
  sol.show();
}

PeasyCam pc;
estrella sol;
PImage backgroundImage;
