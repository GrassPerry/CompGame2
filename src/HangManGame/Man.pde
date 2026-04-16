class Man {
  float x, y;
  boolean[] limbsActive = {true, true, true, true, true, true};
  int limbsRemoved = 0;
  PImage head, armL, armR, body, legL, legR;

  void setup() {
    head = loadImage("Untitled1.png");
    armL = loadImage("Untitled5.png");
    armR = loadImage("Untitled6.png");
    body = loadImage("Untitled4.png");
    legL = loadImage("Untitled3.png");
    legR = loadImage("Untitled2.png");
  }

  Man(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void reset() {
    for (int i = 0; i < 6; i++) limbsActive[i] = true;
    limbsRemoved = 0;
  }
  void removeLimb() {
    if (limbsRemoved < 6) {
      limbsActive[limbsRemoved] = false;
      limbsRemoved++;
    }
  }
  PVector getNextLimbPos() {
    if (limbsRemoved == 0) return new PVector(x, y-50);
    if (limbsRemoved == 1) return new PVector(x, y);
    if (limbsRemoved == 2) return new PVector(x-30, y);
    if (limbsRemoved == 3) return new PVector(x+30, y);
    if (limbsRemoved == 4) return new PVector(x-20, y+50);
    return new PVector(x+20, y+50);
  }
  void display() {
    //broke a bit while I was putting in the image
    //Body parts
    stroke(0);
    strokeWeight(3);
    noFill();
    //all limbs with actual images not just line and ellipses turned off while I figure this out
    //if (limbsActive[0]) image(head, x, y - 50, 40, 40);
    //if (limbsActive[1]) image(armL, x, y - 30, x, y + 30);
    //if (limbsActive[2]) image(armR, x, y - 10, x - 30, y + 10);
    //if (limbsActive[3]) image(body, x, y - 10, x + 30, y + 10);
    //if (limbsActive[4]) image(legL, x, y + 30, x - 20, y + 70);
    //if (limbsActive[5]) image(legR, x, y + 30, x + 20, y + 70);
    if (limbsActive[0]) ellipse(x, y - 50, 40, 40);
    if (limbsActive[1]) line(x, y - 30, x, y + 30);
    if (limbsActive[2]) line(x, y - 10, x - 30, y + 10);
    if (limbsActive[3]) line(x, y - 10, x + 30, y + 10);
    if (limbsActive[4]) line(x, y + 30, x - 20, y + 70);
    if (limbsActive[5]) line(x, y + 30, x + 20, y + 70);
  }
}
