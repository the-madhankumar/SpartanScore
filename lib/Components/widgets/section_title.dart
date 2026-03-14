
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spartan_score/Components/theme/colors.dart';

Widget sectionTitle(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Row(
      children: [
        Container(
          width: 4,
          height: 24,
          decoration: BoxDecoration(
            color: AppColors.run,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.3,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Container(
          width: 70,
          height: 1.5,
          color: AppColors.textPrimary.withOpacity(0.25),
        ),
      ],
    ),
  );
}
