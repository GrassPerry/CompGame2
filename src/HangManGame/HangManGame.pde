TortureHangingMan game;
PImage weaponImg;
ArrayList<Weapons> saws = new ArrayList<Weapons>();

void setup() {
  size(800, 600);
  game = new TortureHangingMan();
  game.character.setup();
  weaponImg = loadImage("Untitled7.png");
}

void draw() {
  background(240);

  for (int i = saws.size() - 1; i >= 0; i--) {
    Weapons s = saws.get(i);
    s.move();
    s.display();

    if (s.isDead) {
      saws.remove(i);
    }
  }

  switch(game.state) {
  case 0:
    game.drawStartScreen();
    break;
  case 1:
    game.runUpdate();
    game.runDisplay();
    break;
  case 2:
    game.drawEndScreen();
    break;
  }
}

void keyPressed() {
  if (game.state == 0) {
    if (key == ' ') game.state = 1;
  } else if (game.state == 1) {
    if ((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z')) {
      game.processGuess(str(key).toLowerCase().charAt(0));
    }
  } else if (game.state == 2) {
    if (key == 'r' || key == 'R') {
      game.resetGame();
      game.state = 0; 
    }
  }
}
