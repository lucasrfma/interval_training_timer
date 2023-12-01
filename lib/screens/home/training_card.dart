import 'package:flutter/material.dart';
import 'package:interval_training_timer/models/training.dart';

class TrainingCard extends StatelessWidget {
  final Training training;
  final void Function() onTap;
  static const summarySize = 3;

  const TrainingCard(
    this.training,
    this.onTap, {
    super.key,
  });

  String _trainingSummary() {
    var intervals = training.intervals;
    StringBuffer summary = StringBuffer();
    String end = "";

    if (intervals.length > summarySize) {
      intervals = intervals.sublist(0, summarySize);
      end = " ...";
    }

    summary
      ..writeAll(intervals.map((it) {
        var nameSplit = it.name.split(' ');
        var result = nameSplit.length > 1
            ? '${nameSplit[0][0]}. ${nameSplit[1]}'
            : it.name;
        if (result.length > 7) result = '${result.substring(0, 6)}.';
        return result;
      }), " | ")
      ..write(end);
    return summary.toString();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Row(
            children: [
              Text(
                training.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              Text(
                _trainingSummary(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
