class Words {
  String[] list = {"sayori", "monika", "natsuki", "yuri", "mc", "kangel", "ame", "pchan"};
  String getRandomWord() { return list[int(random(list.length))]; }
}
