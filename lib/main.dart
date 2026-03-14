import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spartan_score/Components/Screens/home_screen.dart';
import 'package:spartan_score/Components/Service/track.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => Track(), child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}
