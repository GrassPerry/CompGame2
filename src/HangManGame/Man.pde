class Man {
  float x, y;
  boolean[] limbsActive = {true, true, true, true, true, true};
  int limbsRemoved = 0;
  PImage head, armL, armR, body, legL, legR;


  Man(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void setup() {
    head = loadImage("TTHMHead.gif");
    body = loadImage("TTHMBody.gif");
    armL = loadImage("TTHMArmL.gif");
    armR = loadImage("TTHMArmR.gif");
    legL = loadImage("TTHMLegL.gif");
    legR = loadImage("TTHMLegR.gif");
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

  void display() {

    imageMode(CENTER);

    // Head
    if (limbsActive[0]) image(head, x, y-150, 100, 100);
    
    // Body (The torso)
    if (limbsActive[1]) image(body, x, y-50, 80, 120);
    
    // Left Arm
    if (limbsActive[2]) image(armL, x - 55, y - 50, 100, 200);
    
    // Right Arm
    if (limbsActive[3]) image(armR, x + 55, y - 50, 100, 200);
    
    // Left Leg
    if (limbsActive[4]) image(legL, x - 15, y + 85, 70, 200);
    
    // Right Leg
    if (limbsActive[5]) image(legR, x + 15, y + 85, 70, 200);
  }
  PVector getNextLimbPos() {

    if (limbsRemoved == 0) return new PVector(x, y - 50);      // Head
    if (limbsRemoved == 1) return new PVector(x, y);           // Body
    if (limbsRemoved == 2) return new PVector(x - 25, y - 10); // ArmL
    if (limbsRemoved == 3) return new PVector(x + 25, y - 10); // ArmR
    if (limbsRemoved == 4) return new PVector(x - 15, y + 55); // LegL
    return new PVector(x + 15, y + 55);                        // LegR
  }
  
}
