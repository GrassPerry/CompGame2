class Weapons {
  PVector pos, target;
  PImage img;
  float angle = 0;
  boolean isDead = false; 

  Weapons(PVector t, PImage projectileImg) {
    pos = new PVector(-50, random(height));
    target = t;
    this.img = projectileImg;
  }

  void move() {
    PVector dir = PVector.sub(target, pos);
    if (dir.mag() > 7) {
      dir.normalize();
      dir.mult(7);
      pos.add(dir);
    } else {
      isDead = true; 
    }
    angle += 0.2;
  }
  
  boolean reachedTarget() {
    return isDead; 
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    imageMode(CENTER);
    if (img != null) {
      image(img, 0, 0, 40, 40);
    }
    popMatrix();
  }
}
