import 'package:provider/provider.dart';
import 'package:spartan_score/Components/Service/track.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show WatchContext;
import 'package:spartan_score/Components/theme/colors.dart';
import 'package:spartan_score/Components/widgets/match_banner.dart';
import 'package:spartan_score/Components/widgets/score_card.dart';
import 'package:spartan_score/Components/widgets/section_title.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final track = context.watch<Track>();

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
              matchBanner(bannerText: "Result Screen"),

              sectionTitle(track.teamA),
              scoreBoard(score: track.teamAScore, wickets: track.teamAWickets),

              const SizedBox(height: 20.0),

              sectionTitle(track.teamB),
              scoreBoard(score: track.teamBScore, wickets: track.teamBWickets, overs: "Remaining: ${(track.target < track.teamBScore) ? 0 : track.target - track.teamBScore}"),
            ],
          ),
        ),
      ),
    );
  }
}
