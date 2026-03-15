// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spartan_score/Components/Service/track.dart';
import 'package:spartan_score/Components/models/match.dart';
import 'package:spartan_score/Components/theme/colors.dart';
import 'package:spartan_score/Components/widgets/match_banner.dart';
import 'package:spartan_score/Components/widgets/section_title.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final track = context.watch<Track>();

    List<int> overTotal = track.history.map((over) {
      int total = 0;
      for (var ball in over.balls) {
        if (ball.runs != -1) total += ball.runs;
      }
      return total;
    }).toList();

    int ballsPlayed = (track.history.length * 6) + track.timeLineLength;

    double strikeRate = ballsPlayed > 0 ? track.score / ballsPlayed * 100 : 0;

    double runRate = track.history.isNotEmpty
        ? track.score / track.history.length
        : 0;

    double projectedScore = (track.totalOvers ?? 20) * runRate;

    int totalExtras = track.timeline
        .where((ball) => ball.extra != null)
        .fold(0, (sum, ball) => sum + (ball.runs));

    int maxOver = overTotal.isEmpty
        ? 0
        : overTotal.reduce((a, b) => a > b ? a : b);
    double avgOver = overTotal.isEmpty
        ? 0
        : overTotal.reduce((a, b) => a + b) / overTotal.length;

    List<Widget> xAxisLabels = [];

    for (int i = 0; i < overTotal.length; i++) {
      xAxisLabels.add(
        Text(
          "${i + 1}",
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.gradientbackground),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              matchBanner(bannerText: "Analytics Screen"),

              // Worm Graph
              sectionTitle("Worm Graph"),
              _buildCard(
                child: Column(
                  children: [
                    const Text(
                      "Over-by-Over Runs",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SfSparkLineChart(
                      data: overTotal,
                      labelDisplayMode: SparkChartLabelDisplayMode.all,
                      color: Colors.lightGreenAccent.shade400,
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      marker: const SparkChartMarker(
                        displayMode: SparkChartMarkerDisplayMode.all,
                        size: 6,
                        color: Colors.amber,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: xAxisLabels,
                    ),
                  ],
                ),
              ),

              // Team Metrics
              sectionTitle("Team Metrics"),
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _metricRow("Total Runs", track.score.toString()),
                    _metricRow("Wickets", track.wickets.toString()),
                    _metricRow("Current Run Rate", runRate.toStringAsFixed(2)),
                    _metricRow(
                      "Projected Score",
                      projectedScore.toStringAsFixed(0),
                    ),
                  ],
                ),
              ),

              // Batsman Metrics
              sectionTitle("Batsman Metrics"),
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _metricRow(
                      track.currentStriker,
                      "${track.strikerScore} runs | SR: ${track.strikerTimeline > 0 ? (track.strikerScore / track.strikerTimeline * 100).toStringAsFixed(2) : "0"}",
                    ),
                    _metricRow(
                      track.currentNonStriker,
                      "${track.nonstrikerScore} runs | SR: ${track.nonStrikerTimeline > 0 ? (track.nonstrikerScore / track.nonStrikerTimeline * 100).toStringAsFixed(2) : "0"}",
                    ),
                  ],
                ),
              ),

              sectionTitle("Extras"),
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _metricRow("Total Extras", totalExtras.toString()),
                    _metricRow(
                      "Breakdown",
                      "Wides, No Balls, 2G (from timeline)",
                    ),
                  ],
                ),
              ),

              sectionTitle("Over Analysis"),
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _metricRow("Max Runs in an Over", maxOver.toString()),
                    _metricRow(
                      "Average Runs per Over",
                      avgOver.toStringAsFixed(2),
                    ),
                  ],
                ),
              ),

              sectionTitle("Score Card"),

              Column(
                children: <Widget>[
                  ...displayScoreCard(context.watch<Track>().scorecard),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _metricRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget displayCard({required Player child}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              child.playerName.toString(),
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              child.runsScored.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.greenAccent),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              child.ballsFaced.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ((child.runsScored / child.ballsFaced) * 100).toStringAsFixed(1),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.lightGreen),
            ),
          ),
        ],
      ),
    ),
  );
}

List displayScoreCard(List<Player> scores) {
  List<Widget> cards = [];
  for (var scored in scores) {
    cards.add(displayCard(child: scored));
  }
  return cards;
}
