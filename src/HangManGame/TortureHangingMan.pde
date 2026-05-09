class TortureHangingMan {
  Words wordManager;
  Man character;
  ArrayList<Weapons> activeWeapons;
  PImage startScreen, sawImg;

  String secretWord;
  String displayWord;
  String guessedLetters = "";
  int mistakes = 0;
  int state = 0;
  boolean won = false;

  TortureHangingMan() {
    wordManager = new Words();
    character = new Man(width/2, height/2);
    activeWeapons = new ArrayList<Weapons>();
    startScreen = loadImage("IntroScrnTTHM.png");
    sawImg = loadImage("Untitled7.png");
    resetGame();
    state = 0;
  }

  void resetGame() {
    secretWord = wordManager.getRandomWord();
    displayWord = "";
    for (int i = 0; i < secretWord.length(); i++) displayWord += "_";
    mistakes = 0;
    guessedLetters = "";
    activeWeapons.clear();
    character.reset();
    won = false;
  }

  void processGuess(char letter) {
    if (state != 1 || guessedLetters.indexOf(letter) != -1) return;
    guessedLetters += letter;

    if (secretWord.indexOf(letter) != -1) {

      activeWeapons.add(new Weapons(character.getNextLimbPos(), sawImg));

      char[] temp = displayWord.toCharArray();
      for (int i = 0; i < secretWord.length(); i++) {
        if (secretWord.charAt(i) == letter) temp[i] = letter;
      }
      displayWord = String.valueOf(temp);
    } else {
      mistakes++;
      if (mistakes >= 6) {
        state = 2;
        won = false;
      }
    }

    if (displayWord.equals(secretWord)) {
      state = 2;
      won = true;
    }
  }

  void drawStartScreen() {
    if (startScreen != null) {
      imageMode(CORNER);
      image(startScreen, 0, 0, width, height);
    }
    textAlign(CENTER);
    fill(255);
    textSize(20);
    text("PRESS SPACE TO START", width/2, height - 50);
  }

  void drawEndScreen() {
    background(won ? color(50, 100, 50) : color(100, 50, 50));
    textAlign(CENTER);
    fill(255);
    textSize(60);
    text(won ? "VICTORY" : "DEFEAT", width/2, height/2 - 50);
    textSize(25);
    text("The word was: " + secretWord.toUpperCase(), width/2, height/2 + 20);
    textSize(18);
    text("Press 'R' to Restart", width/2, height/2 + 100);
  }

  void runUpdate() {
    for (int i = activeWeapons.size()-1; i >= 0; i--) {
      Weapons w = activeWeapons.get(i);
      w.move();

      if (w.reachedTarget()) {
        character.removeLimb();
        activeWeapons.remove(i);
      }
    }
  }

  void runDisplay() {
    character.display();
    for (Weapons w : activeWeapons) w.display();

    fill(0);
    textAlign(CENTER);
    textSize(40);
    text(displayWord.toUpperCase().replace("", " ").trim(), width/2, height - 120);
    textSize(18);
    text("Guessed: " + guessedLetters.toUpperCase(), width/2, height - 60);
  }
}
