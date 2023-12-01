import 'package:flutter/material.dart' hide Interval;
import 'package:interval_training_timer/models/interval.dart';
import 'package:interval_training_timer/models/training.dart';
import 'package:interval_training_timer/screens/home_screen.dart';

var kLightColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
var kLightTheme = ThemeData.from(colorScheme: kLightColorScheme).copyWith(
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kLightColorScheme.primary,
    foregroundColor: kLightColorScheme.onPrimary,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kLightColorScheme.primaryContainer,
    margin: const EdgeInsets.all(6.0),
  ),
);
var kDarkColorScheme = kLightColorScheme.copyWith(brightness: Brightness.dark);
var kDarkTheme = kLightTheme.copyWith(
    colorScheme: kDarkColorScheme, brightness: Brightness.dark);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final dummyTrainingList = [
    Training("Park Training", [
      Interval("Walk", const Duration(seconds: 5), alarmDuration: 4),
      Interval("Squat", const Duration(seconds: 5), alarmDuration: 4),
      Interval("Rest", const Duration(seconds: 5), alarmDuration: 4),
    ]),
    Training("Home Training", [
      Interval("Burpees", const Duration(seconds: 5), alarmDuration: 4),
      Interval("Horse Stance", const Duration(seconds: 5), alarmDuration: 4),
      Interval("Free Hang", const Duration(seconds: 5), alarmDuration: 4),
      Interval("Plank", const Duration(seconds: 5), alarmDuration: 4),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: kLightTheme,
      darkTheme: kDarkTheme,
      home: HomeScreen(dummyTrainingList),
    );
  }
}
