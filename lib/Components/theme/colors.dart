import 'package:flutter/material.dart';

class AppColors {
  static const gradientbackground = LinearGradient(
    colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const background = Color(0xFF121212);
  static const card = Color(0xFF1E1E1E);

  static const run = Color(0xFF1976D2);
  static const boundary = Color(0xFF42A5F5);

  static const extra = Color(0xFFFB8C00);
  static const wicket = Color(0xFFE53935);

  static const undo = Color(0xFF616161);

  static const textPrimary = Colors.white;
  static const textSecondary = Color(0xFFB0B0B0);
}

class ButtonDesign {
  static const height = 70;
  static const minimumwidth = 90;
  static const borderradius = 12;
  static const fontsize = 22;
  static const fontweight = FontWeight.bold;
  static const elevation = 2; // 2 - 4
}
