import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show WatchContext;
import 'package:spartan_score/Components/Service/track.dart';
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
              sectionTitle(context.watch<Track>().teamA),
              scoreBoard(
                score: context.watch<Track>().teamAScore,
                wickets: context.watch<Track>().teamAWickets,
              ),
              SizedBox(height: 20.0),
              sectionTitle(context.watch<Track>().teamB),
              scoreBoard(
                score: context.watch<Track>().teamBScore,
                wickets: context.watch<Track>().teamBWickets,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
