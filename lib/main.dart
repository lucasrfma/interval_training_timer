import 'package:flutter/material.dart';
import 'package:interval_training_timer/models/interval_definition.dart';
import 'package:interval_training_timer/models/training_definition.dart';
import 'package:interval_training_timer/widgets/interval_timer/training_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final dummyTraining = TrainingDefinition("Park", [
    IntervalDefinition("Walk", const Duration(seconds: 5), alarmDuration: 4),
    IntervalDefinition("Squat", const Duration(seconds: 5), alarmDuration: 4),
    IntervalDefinition("Rest", const Duration(seconds: 5), alarmDuration: 4),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Interval Training Timer"),
          ),
          body: TrainingHome(dummyTraining)),
    );
  }
}
