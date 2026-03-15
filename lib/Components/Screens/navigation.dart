import 'package:flutter/material.dart';
import 'package:spartan_score/Components/Screens/analytics_screen.dart';
import 'package:spartan_score/Components/theme/colors.dart';
import 'package:spartan_score/Components/Screens/scoring_screen.dart';
import 'package:spartan_score/Components/Screens/over_summary_screen.dart';
import 'package:spartan_score/Components/Screens/result_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int index = 0;

  final screens = [
    ScoringScreen(),
    AnalyticsScreen(),
    HistoryScreen(),
    ResultScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: AppColors.gradientbackground,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: screens[index],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.gradientbackground,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white70, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    indicatorColor: Colors.transparent,
                    labelTextStyle:
                        MaterialStateProperty.resolveWith<TextStyle>((
                          Set<MaterialState> states,
                        ) {
                          if (states.contains(MaterialState.selected)) {
                            return const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            );
                          }
                          return const TextStyle(color: Colors.white70);
                        }),
                  ),
                  child: NavigationBar(
                    backgroundColor: Colors.transparent,
                    selectedIndex: index,
                    onDestinationSelected: (i) {
                      setState(() {
                        index = i;
                      });
                    },
                    animationDuration: const Duration(milliseconds: 300),
                    labelBehavior:
                        NavigationDestinationLabelBehavior.onlyShowSelected,
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(
                          Icons.sports_cricket_outlined,
                          color: Colors.white70,
                        ),
                        selectedIcon: Icon(
                          Icons.sports_cricket,
                          color: Colors.white,
                        ),
                        label: "Score",
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.analytics_outlined,
                          color: Colors.white70,
                        ),
                        selectedIcon: Icon(
                          Icons.analytics,
                          color: Colors.white,
                        ),
                        label: "Analytics",
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.history_outlined,
                          color: Colors.white70,
                        ),
                        selectedIcon: Icon(Icons.history, color: Colors.white),
                        label: "History",
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.emoji_events_outlined,
                          color: Colors.white70,
                        ),
                        selectedIcon: Icon(
                          Icons.emoji_events,
                          color: Colors.white,
                        ),
                        label: "Result",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
