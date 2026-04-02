char screen = 's';

void setup() {
}

void draw() {
  switch(screen) {
  case 's':
    break;
  case 'p':
    break;
  case 'g':
    break;
  }
}

void play() {
  
}

void drawStart() {
  background(255);
  textAlign(CENTER);
  textSize(32);
  text("START SCREEN", width/2, 50);
}
void drawPlay() {
  background(255);
  textAlign(CENTER);
  textSize(32);
  text("YOU ARE NOW PLAYING", width/2, 50);
}

void drawGameover() {
  background(255);
  textAlign(CENTER);
  textSize(32);
  text("UR DEAD BRO", width/2, 50);
}

void keyPressed() {
  
}

void keyReleased() {
  
}
