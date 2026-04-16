class Weapons {
  PVector pos, target;
  PImage saw;
  
  void setup() {
    saw = loadImage("Untitled7.png");
  }
  Weapons(PVector t) {
    //currently trying to figure out how to make it so with each word you get right it actually sends the saws in the right place to like cut off a limb ig?
    pos = new PVector(-50, 50);
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
    fill(255);
    //same with the saw as the body part, it just nullpointers but I'll figure it out
    //image(saw, pos.x, pos.y, 10, 10);
    rect(pos.x, pos.y, 10, 10);
  }
}
