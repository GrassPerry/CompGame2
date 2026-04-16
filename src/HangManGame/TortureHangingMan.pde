class TortureHangingMan {
  Words wordManager;
  Man character;
  ArrayList<Weapons> activeWeapons;

  String secretWord;
  String displayWord;
  String guessedLetters = "";
  int mistakes = 0;
  int state = 0;
  boolean won = false;

  TortureHangingMan() {
    wordManager = new Words();
    character = new Man(width/2, height/2 + 50);
    activeWeapons = new ArrayList<Weapons>();
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
    state = 1;
    won = false;
  }

  void processGuess(char letter) {
    if (state != 1 || guessedLetters.indexOf(letter) != -1) return;
    guessedLetters += letter;

    if (secretWord.indexOf(letter) != -1) {
      activeWeapons.add(new Weapons(character.getNextLimbPos()));
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
    //image will be put in later
    textAlign(CENTER);
    fill(0);
    textSize(50);
    text("TORTURE HANGMAN", width/2, height/2 - 40);
    textSize(20);
    text("Guess correctly to dismantle the man.", width/2, height/2 + 20);
    text("(Hint, currently all words are just doki doki literature club characters)", width/2, height/2 + 40);
    text("Also the reset does work, I just only have five words so yknow it may take a bit to get a new one.", width/2, height/2 + 150);
    fill(150, 0, 0);
    text("PRESS SPACE TO BEGIN", width/2, height/2 + 80);
  }

  void drawEndScreen() {
    background(won ? color(200, 255, 200) : color(255, 200, 200));
    textAlign(CENTER);
    fill(0);
    textSize(60);
    text(won ? "VICTORY" : "DEFEAT", width/2, height/2 - 50);

    textSize(25);
    text("The word was: " + secretWord.toUpperCase(), width/2, height/2 + 20);

    textSize(18);
    fill(50);
    text("Press 'R' to Return to Start", width/2, height/2 + 100);
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
