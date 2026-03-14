// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spartan_score/Components/models/ball.dart';
import 'package:spartan_score/Components/theme/colors.dart';
import 'package:spartan_score/Components/widgets/extras_buttons.dart';
import 'package:spartan_score/Components/widgets/get_value.dart';
import 'package:spartan_score/Components/widgets/match_banner.dart';
import 'package:spartan_score/Components/widgets/score_card.dart';
import 'package:spartan_score/Components/widgets/section_title.dart';
import 'package:spartan_score/Components/widgets/timeline_single.dart';
import 'package:spartan_score/Components/widgets/undo_button.dart';
import 'package:spartan_score/Components/widgets/wicket_button.dart';

class ScoringScreen extends StatefulWidget {
  const ScoringScreen({super.key});

  @override
  State<ScoringScreen> createState() => _ScoringScreenState();
}

class _ScoringScreenState extends State<ScoringScreen> {
  final List<String> overvals = ["1", "2", "3", "4", "6", "0"];
  int score = 0;
  int wickets = 0;

  int timeLineLength = 0;
  List<Ball> timeline = [];
  List<Over> history = [];
  bool overCompleted = false;

  void addScore(String val) {
    if (overCompleted) return;

    setState(() {
      int run = int.parse(val);

      score += run;

      timeline.add(Ball(runs: run));
      timeLineLength++;

      if (timeLineLength == 6) {
        overCompleted = true;
      }
    });
  }

  void wicket() {
    if (overCompleted) return;

    setState(() {
      wickets++;

      timeline.add(Ball(wicket: true));
      timeLineLength++;

      if (timeLineLength == 6) {
        overCompleted = true;
      }
    });
  }

  void wide() {
    setState(() {
      score += 1;
      timeline.add(Ball(extra: "WD"));
    });
  }

  void twoG() {
    if (overCompleted) return;
    setState(() {
      score += 2;
      timeline.add(Ball(extra: "2G"));
      timeLineLength += 1;
      if (timeLineLength == 6) {
        overCompleted = true;
      }
    });
  }

  void noBall() {
    setState(() {
      score += 1;
      timeline.add(Ball(extra: "NB"));
    });
  }

  void nextOver() {
    setState(() {
      history.add(Over()..balls = List.from(timeline));

      timeline.clear();
      timeLineLength = 0;

      overCompleted = false;
    });
  }

  double get getovers {
    int completedOvers = history.length;
    double currentOver = (timeLineLength * 0.1);

    if (timeLineLength == 6) {
      return completedOvers + 1;
    }
    return completedOvers + currentOver;
  }

  List<Extras> get availableExtra => [
    Extras("NB", noBall),
    Extras("2G", twoG),
    Extras("WD", wide),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.gradientbackground),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            children: [
              matchBanner(bannerText: "Scoring Screen"),

              scoreBoard(score: score, wickets: wickets, overs: getovers),

              const SizedBox(height: 40),
              displayTimeLine(vals: timeline, timeLineLength: timeLineLength),
              if (overCompleted)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: ButtonDesign.height,
                    width: 110,
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      elevation: 2,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: nextOver,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AppColors.undo, width: 2),
                            gradient: LinearGradient(
                              colors: [
                                AppColors.undo.withOpacity(0.9),
                                AppColors.undo.withOpacity(0.6),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.next_plan,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "NEXT OVER",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 40),
              sectionTitle("Over Values"),
              getValueWidget(
                vals: overvals,
                onPressed: overCompleted ? (_) {} : addScore,
                selectedValue: null,
              ),

              const SizedBox(height: 40),
              sectionTitle("Extras"),
              getExtraWidget(vals: availableExtra),

              const SizedBox(height: 40),
              sectionTitle("Actions"),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  wicketButton(onPressed: wicket),
                  SizedBox(width: 40),
                  undoButton(onPressed: wicket),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Extras {
  late String label;
  late void Function() onPressed;

  Extras(this.label, this.onPressed);
}

Widget getExtraWidget({required List<Extras> vals}) {
  return Wrap(
    spacing: 18,
    runSpacing: 18,
    alignment: WrapAlignment.center,
    children: [
      for (var num in vals)
        extraButton(label: num.label, onPressed: num.onPressed),
    ],
  );
}

(String, Color) getBallValue(Ball given) {
  String currentStatus = "";
  Color background;

  if (given.wicket == true) {
    currentStatus = "W";
    background = AppColors.wicket;
  } else if (given.extra.isNotEmpty) {
    currentStatus = given.extra;
    background = AppColors.extra;
  } else if (given.runs != -1) {
    currentStatus = given.runs.toString();
    background = AppColors.run;
  } else {
    currentStatus = "";
    background = AppColors.textPrimary;
  }
  return (currentStatus, background);
}

Widget displayTimeLine({
  required List<Ball> vals,
  required int timeLineLength,
}) {
  return Wrap(
    spacing: 18,
    runSpacing: 18,
    alignment: WrapAlignment.center,
    children: vals.map((ball) {
      final result = getBallValue(ball);

      return timelineSingle(number: result.$1, backgroundColor: result.$2);
    }).toList(),
  );
}
