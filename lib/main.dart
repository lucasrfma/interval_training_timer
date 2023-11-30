import 'package:flutter/material.dart' hide Interval;
import 'package:interval_training_timer/models/interval.dart';
import 'package:interval_training_timer/models/training.dart';
import 'package:interval_training_timer/screens/home/home_screen.dart';

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
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(dummyTrainingList),
    );
  }
}
