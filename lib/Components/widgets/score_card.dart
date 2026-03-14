// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spartan_score/Components/theme/colors.dart';

Widget scoreBoard({required int score, required int wickets, double? overs}) {
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
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "SCORE",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
            color: Colors.white70,
          ),
        ),

        const SizedBox(height: 14),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "/",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),
            ),

            Text(
              wickets.toString(),
              style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w700,
                color: Colors.white70,
              ),
            ),
          ],
        ),

        if (overs != null) ...[
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.08),
            ),
            child: Text(
              "Overs: ${overs.toStringAsFixed(1)}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ],
    ),
  );
}
