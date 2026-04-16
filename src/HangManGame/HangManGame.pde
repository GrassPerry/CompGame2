TortureHangingMan game;

void setup() {
  size(800, 600);
  game = new TortureHangingMan();
}

void draw() {
  background(240);
  
  // State Machine logic
  switch(game.state) {
    case 0: // START SCREEN
      game.drawStartScreen();
      break;
    case 1: // PLAYING
      game.runUpdate();
      game.runDisplay();
      break;
    case 2: // END SCREEN
      game.drawEndScreen();
      break;
  }
}

void keyPressed() {
  if (game.state == 0) {
    if (key == ' ') game.state = 1; // Press Space to Start
  } 
  else if (game.state == 1) {
    if ((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z')) {
      game.processGuess(str(key).toLowerCase().charAt(0));
    }
  } 
  else if (game.state == 2) {
    if (key == 'r' || key == 'R') game.resetGame(); // Press R to Reset
  }
}
