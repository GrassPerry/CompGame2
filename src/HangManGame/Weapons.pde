class Weapons {
  PVector pos, target;
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
    rect(pos.x, pos.y, 10, 10);
  }
}
