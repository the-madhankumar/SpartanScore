import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spartan_score/Components/Service/track.dart';
import 'package:spartan_score/Components/models/ball.dart';
import 'package:spartan_score/Components/theme/colors.dart';
import 'package:spartan_score/Components/widgets/match_banner.dart';
import 'package:spartan_score/Components/widgets/timeline_single.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.gradientbackground),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            children: [
              matchBanner(bannerText: "Summary Screen"),

              Column(
                children: [
                  for (
                    int index = 0;
                    index < context.watch<Track>().history.length;
                    index++
                  )
                    Builder(
                      builder: (context) {
                        final over = context.watch<Track>().history[index];

                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierColor: Colors.black.withOpacity(
                                0.5,
                              ), // semi-transparent background
                              builder: (context) => AlertDialog(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                content: boardTimeline(vals: over.balls),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.amber.shade300,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Over ${index + 1}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  "Total ${getTotal(context.watch<Track>().history[index].balls)}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

(String, Color, int) getBallValue(Ball given) {
  String currentStatus = "";
  Color background;
  int runs = 0;

  if (given.wicket == true) {
    currentStatus = "W";
    background = AppColors.wicket;
  } else if (given.extra.isNotEmpty) {
    currentStatus = given.extra;
    background = AppColors.extra;
    runs = given.runs;
  } else if (given.runs != -1) {
    currentStatus = given.runs.toString();
    background = AppColors.run;
    runs = given.runs;
  } else {
    currentStatus = "";
    background = AppColors.textPrimary;
  }
  return (currentStatus, background, runs);
}

int getTotal(List<Ball> vals){
  int resultTotal = 0;
  for(var i in vals){
    resultTotal += i.runs;
  }
  return resultTotal;
}

Widget displayTimeLine({required List<Ball> vals}) {
  int currentOverTotal = 0;

  final ballWidgets = vals.map((ball) {
    final result = getBallValue(ball);
    currentOverTotal += result.$3;
    return timelineSingle(number: result.$1, backgroundColor: result.$2);
  }).toList();

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Wrap(
        spacing: 18,
        runSpacing: 18,
        alignment: WrapAlignment.center,
        children: ballWidgets,
      ),
      const SizedBox(height: 12),
      Text(
        "Total: $currentOverTotal",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget boardTimeline({required List<Ball> vals}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 26),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(32),
      border: Border.all(color: AppColors.undo.withOpacity(0.7), width: 2),
      gradient: const LinearGradient(
        colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.35),
          blurRadius: 18,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: displayTimeLine(vals: vals),
  );
}
