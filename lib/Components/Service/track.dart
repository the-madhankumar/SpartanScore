import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spartan_score/Components/theme/colors.dart';
import 'package:spartan_score/Components/models/ball.dart';

class Over {
  List<Ball> balls = [];
}

class Track extends ChangeNotifier {
  int? totalOvers;
  int? totalTeamSize;
  String teamA = "";
  String teamB = "";

  int score = 0;
  int wickets = 0;

  int timeLineLength = 0;
  List<Ball> timeline = [];
  List<Over> history = [];
  bool overCompleted = false;

  // ---------------- Team & Match Setup ----------------
  void setOvers(String value) {
    totalOvers = int.tryParse(value);
    notifyListeners();
  }

  void setTeamSize(String value) {
    totalTeamSize = int.tryParse(value);
    notifyListeners();
  }

  void setTeamA(String value, BuildContext context) {
    if (value == teamB) {
      showError("Both teams cannot be the same", context);
      return;
    }
    teamA = value;
    notifyListeners();
  }

  void setTeamB(String value, BuildContext context) {
    if (value == teamA) {
      showError("Both teams cannot be the same", context);
      return;
    }
    teamB = value;
    notifyListeners();
  }

  void showError(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.background,
        content: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  // ---------------- Score Tracking ----------------
  void addScore(String val) {
    if (overCompleted) return;
    int run = int.tryParse(val) ?? 0;
    score += run;
    timeline.add(Ball(runs: run));
    timeLineLength++;
    if (timeLineLength >= 6) overCompleted = true;
    notifyListeners();
  }

  void wicket() {
    if (overCompleted) return;
    wickets++;
    timeline.add(Ball(wicket: true));
    timeLineLength++;
    if (timeLineLength >= 6) overCompleted = true;
    notifyListeners();
  }

  void wide() {
    score += 1;
    timeline.add(Ball(extra: "WD"));
    notifyListeners();
  }

  void twoG() {
    if (overCompleted) return;
    score += 2;
    timeline.add(Ball(extra: "2G"));
    timeLineLength++;
    if (timeLineLength >= 6) overCompleted = true;
    notifyListeners();
  }

  void noBall() {
    score += 1;
    timeline.add(Ball(extra: "NB"));
    notifyListeners();
  }

  void nextOver() {
    history.add(Over()..balls = List.from(timeline));
    timeline.clear();
    timeLineLength = 0;
    overCompleted = false;
    notifyListeners();
  }

  void resetMatch() {
    score = 0;
    wickets = 0;
    timeline.clear();
    history.clear();
    timeLineLength = 0;
    overCompleted = false;
    totalOvers = null;
    totalTeamSize = null;
    teamA = "";
    teamB = "";
    notifyListeners();
  }
}
