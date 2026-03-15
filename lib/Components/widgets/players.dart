import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spartan_score/Components/Service/track.dart';
import 'package:spartan_score/Components/theme/colors.dart';

class PlayerScoreCard extends StatelessWidget {
  final String name;
  final int score;
  final int timeline;
  final bool isActive;

  const PlayerScoreCard({
    Key? key,
    required this.name,
    required this.score,
    required this.timeline,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: isActive
                ? Border.all(color: Colors.lightGreenAccent, width: 2)
                : null,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white54,
            ),
          ),
        ),

        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                score.toString(),
                style: const TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                timeline.toString(),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w200,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget scorePlayers() {
  return Consumer<Track>(
    builder: (context, track, child) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.undo.withOpacity(0.6), width: 2),
          gradient: const LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "SCORE",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 18),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Striker
                PlayerScoreCard(
                  name: "Striker",
                  score: track.strikerScore,
                  timeline: track.strikerTimeline,
                  isActive: track.togglePlayers,
                ),

                // Non-Striker
                PlayerScoreCard(
                  name: "Non-Striker",
                  score: track.nonstrikerScore,
                  timeline: track.nonStrikerTimeline,
                  isActive: !track.togglePlayers,
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
