// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:spartan_score/Components/Data/teams.dart';
import 'package:spartan_score/Components/Screens/scoring_screen.dart';
import 'package:spartan_score/Components/theme/colors.dart';
import 'package:spartan_score/Components/widgets/get_value.dart';
import 'package:spartan_score/Components/widgets/match_banner.dart';
import 'package:spartan_score/Components/widgets/run_buttons.dart';
import 'package:spartan_score/Components/widgets/section_title.dart';

class MatchSetupScreen extends StatefulWidget {
  const MatchSetupScreen({super.key});

  @override
  State<MatchSetupScreen> createState() => _MatchSetupScreenState();
}

class _MatchSetupScreenState extends State<MatchSetupScreen> {
  int? overs;
  int? teamSize;
  String? teamA;
  String? teamB;

  final List<String> availableOvers = ["6", "8", "10"];
  final List<String> availableTeamSize = ["8", "9", "10", "11"];
  final List<String> availableTeams = [
    "Chennai Super Kings",
    "Mumbai Indians",
    "Gujarat Titans",
    "Royal Challengers Bengaluru",
    "Kolkata Knight Riders",
    "Delhi Capitals",
    "Rajasthan Royals",
    "Sunrisers Hyderabad",
    "Punjab Kings",
    "Lucknow Super Giants",
  ];

  Map<String, dynamic> get teamsMap => {
    availableTeams[0]: TeamCode.CSK,
    availableTeams[1]: TeamCode.MI,
    availableTeams[2]: TeamCode.GT,
    availableTeams[3]: TeamCode.RCB,
    availableTeams[4]: TeamCode.KKR,
    availableTeams[5]: TeamCode.DC,
    availableTeams[6]: TeamCode.RR,
    availableTeams[7]: TeamCode.SRH,
    availableTeams[8]: TeamCode.PBKS,
    availableTeams[9]: TeamCode.LSG,
  };
  
  void setOvers(String value) {
    setState(() {
      overs = int.parse(value);
    });
  }

  void setTeamSize(String value) {
    setState(() {
      teamSize = int.parse(value);
    });
  }

  void setTeamA(String value) {
    if (value == teamB) {
      showError("Both teams cannot be the same");
      return;
    }
    setState(() {
      teamA = value;
    });
  }

  void setTeamB(String value) {
    if (value == teamA) {
      showError("Both teams cannot be the same");
      return;
    }
    setState(() {
      teamB = value;
    });
  }

  void showError(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.background,
        content: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.gradientbackground),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
            child: Column(
              children: [
                matchBanner(bannerText: "Match Setup"),

                const SizedBox(height: 40),

                sectionTitle("Overs"),
                getValueWidget(
                  vals: availableOvers,
                  onPressed: setOvers,
                  selectedValue: overs,
                ),

                const SizedBox(height: 30),

                sectionTitle("Team Size"),
                getValueWidget(
                  vals: availableTeamSize,
                  onPressed: setTeamSize,
                  selectedValue: teamSize,
                ),

                const SizedBox(height: 30),

                sectionTitle("Team A"),
                getTeamDropdown(
                  value: teamA,
                  teams: availableTeams,
                  onChanged: setTeamA,
                ),

                const SizedBox(height: 24),

                sectionTitle("Team B"),
                getTeamDropdown(
                  value: teamB,
                  teams: availableTeams,
                  onChanged: setTeamB,
                ),

                const SizedBox(height: 40),

                SizedBox(
                  height: 64,
                  width: 220,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.run,
                      foregroundColor: AppColors.textPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      if (overs == null ||
                          teamSize == null ||
                          teamA == null ||
                          teamB == null) {
                        showError("Complete all match settings");
                        return;
                      }

                      print("Overs: $overs");
                      print("Team Size: $teamSize");
                      print("Team A: $teamA");
                      print("Team B: $teamB");

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ScoringScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Start Match",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget getTeamDropdown({
  required String? value,
  required List<String> teams,
  required Function(String) onChanged,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: AppColors.run,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.textPrimary.withOpacity(0.2)),
    ),
    child: DropdownButton<String>(
      value: value,
      dropdownColor: AppColors.run,
      hint: const Text(
        "Select Team",
        style: TextStyle(color: AppColors.textPrimary),
      ),
      isExpanded: true,
      underline: const SizedBox(),
      icon: const Icon(Icons.keyboard_arrow_down),
      items: teams.map((team) {
        return DropdownMenuItem(
          value: team,
          child: Text(
            team,
            style: const TextStyle(color: AppColors.textPrimary),
          ),
        );
      }).toList(),
      onChanged: (val) {
        if (val != null) {
          onChanged(val);
        }
      },
    ),
  );
}
