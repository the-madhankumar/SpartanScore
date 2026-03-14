class Ball {
  int runs;
  String extra; // wide, noball, bye, legbye
  bool wicket;

  Ball({
    this.runs = 0,
    this.extra = "",
    this.wicket = false,
  });
}

class Over {
  List<Ball> balls = [];
  bool locked = false;
}