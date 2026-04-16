class Words {
  String[] list = {"sayori", "monika", "natsuki", "yuri", "mc"};
  String getRandomWord() { return list[int(random(list.length))]; }
}
