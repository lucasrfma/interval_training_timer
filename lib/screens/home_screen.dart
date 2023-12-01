import 'package:flutter/material.dart';
import 'package:interval_training_timer/models/training.dart';
import 'package:interval_training_timer/screens/home/training_card.dart';
import 'package:interval_training_timer/screens/training_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Training> trainingList;

  const HomeScreen(
    this.trainingList, {
    super.key,
  });

  void _trainingSelected(BuildContext context, Training training) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TrainingScreen(training)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Interval Training Timer'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => TrainingCard(trainingList[index], () {
          _trainingSelected(context, trainingList[index]);
        }),
        itemCount: trainingList.length,
      ),
    );
  }
}
