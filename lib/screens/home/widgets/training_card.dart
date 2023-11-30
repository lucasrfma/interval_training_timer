import 'package:flutter/material.dart';
import 'package:interval_training_timer/models/training.dart';

class TrainingCard extends StatelessWidget {
  final Training training;
  final void Function() onTap;

  const TrainingCard(
    this.training,
    this.onTap, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Text(training.name),
      ),
    );
  }
}
