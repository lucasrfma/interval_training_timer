import 'package:interval_training_timer/models/interval_definition.dart';

class TrainingDefinition {
  final List<IntervalDefinition> intervals;
  final String name;

  const TrainingDefinition(this.name, this.intervals);
}
