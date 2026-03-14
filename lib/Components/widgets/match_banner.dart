// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spartan_score/Components/theme/colors.dart';

Widget matchBanner({required String bannerText}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 12),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.12),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey.withOpacity(0.35), width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Row(
      children: [
        Image.asset(
          "assets/Images/logo.png",
          height: 60,
          width: 60,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.sports_cricket,
              size: 48,
              color: AppColors.textPrimary,
            );
          },
        ),

        const SizedBox(width: 18),

        Expanded(
          child: Text(
            bannerText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.6,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    ),
  );
}
