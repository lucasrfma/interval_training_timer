import 'package:flutter/material.dart';
import 'package:interval_training_timer/models/training.dart';
import 'package:interval_training_timer/screens/home/training_card.dart';
import 'package:interval_training_timer/screens/training_edit_screen.dart';
import 'package:interval_training_timer/screens/training_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Training> trainingList;

  const HomeScreen(
    this.trainingList, {
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _trainingSelected(BuildContext context, Training training) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TrainingScreen(training)),
    );
  }

  Future<void> _addTraining() async {
    Training? newTraining = await Navigator.push<Training>(context,
        MaterialPageRoute(builder: (context) => const TrainingEditScreen()));
    if (newTraining != null) {
      setState(() {
        widget.trainingList.add(newTraining);
      });
    }
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
              onPressed: _addTraining,
              icon: const Icon(Icons.add),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            TrainingCard(widget.trainingList[index], () {
          _trainingSelected(context, widget.trainingList[index]);
        }),
        itemCount: widget.trainingList.length,
      ),
    );
  }
}
