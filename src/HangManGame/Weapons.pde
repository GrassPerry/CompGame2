class Weapons {
  PVector pos, target;
  PImage saw;
  
  void setup() {
    saw = loadImage("Untitled7.png");
  }
  Weapons(PVector t) {
    pos = new PVector(-50, random(height));
    target = t;
  }
  void move() {
    PVector dir = PVector.sub(target, pos);
    dir.normalize();
    dir.mult(7);
    pos.add(dir);
  }
  boolean reachedTarget() {
    return dist(pos.x, pos.y, target.x, target.y) < 7;
  }
  void display() {
    fill(255, 0, 0);
    //same with the saw as the body part, it just nullpointers but I'll figure it out
    //image(saw, pos.x, pos.y, 10, 10);
    rect(pos.x, pos.y, 10, 10);
  }
}
