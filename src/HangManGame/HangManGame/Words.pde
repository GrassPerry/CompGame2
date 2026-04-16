class Words {
  String[] list = {"processing", "creative", "logic", "variable"};
  String getRandomWord() { return list[int(random(list.length))]; }
}
