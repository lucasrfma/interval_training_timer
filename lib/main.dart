import 'package:flutter/material.dart';
import 'package:interval_training_timer/models/interval_definition.dart';
import 'package:interval_training_timer/models/training_definition.dart';
import 'package:interval_training_timer/widgets/interval_timer/training_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const dummyTraining = TrainingDefinition("Park", [
    IntervalDefinition("Walk", Duration(seconds: 3)),
    IntervalDefinition("Sprint", Duration(seconds: 3)),
    IntervalDefinition("Rest", Duration(seconds: 3)),
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
          body: const TrainingHome(dummyTraining)),
    );
  }
}
