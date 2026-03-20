import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spartan_score/Components/Screens/home_screen.dart';
import 'package:spartan_score/Components/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainTextStyle = TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w900,
      color: AppColors.textSecondary,
      letterSpacing: 1.2,
    );

    final footerTextStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary.withOpacity(0.7),
      letterSpacing: 1.5,
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.gradientbackground),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/Images/logo.png', height: 180),
                      const SizedBox(height: 20),
                      Text("SPARTAN SCORE", style: mainTextStyle),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Text("from", style: footerTextStyle),
                    const SizedBox(height: 4),
                    Text(
                      "SPARTAN STRIKERS",
                      style: footerTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Image.asset('assets/Images/sslogo.png', height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
