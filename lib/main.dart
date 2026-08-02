import 'package:flutter/material.dart';
import 'package:meu_app_habitos/views/home_view.dart';

void main() => runApp(const HabitTrackerApp());

class HabitTrackerApp extends StatelessWidget{
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HabitFlow",

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF7FC),
        colorSchemeSeed: const Color(0xFF3A0891),
      ),
      home: const HomeView(),
    );
  }
}

