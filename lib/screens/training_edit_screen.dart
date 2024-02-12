import 'package:flutter/material.dart';
import 'package:interval_training_timer/models/training.dart';

class TrainingEditScreen extends StatefulWidget {
  final Training? training;

  const TrainingEditScreen({super.key, this.training});

  @override
  State<StatefulWidget> createState() => _TrainingEditScreenState();
}

class _TrainingEditScreenState extends State<TrainingEditScreen> {
  final _formKey = GlobalKey<FormState>();
  String _enteredTitle = '';
  final List<(String, String)> _enteredIntervals = List.empty(growable: true);

  String? _validateTitle(String? value) {
    String name = (value ?? '').trim();
    if (name.length < 2) {
      return "Must have 2+ characters.";
    }
    if (name.length > 50) {
      return "Must be at most 50 characters.";
    }
    return null;
  }

  String? _validateIntervalName(String? value) {
    String name = (value ?? '').trim();
    if (name.length < 2) {
      return "Must have 2+ characters.";
    }
    if (name.length > 20) {
      return "Must be at most 20 characters.";
    }
    return null;
  }

  String? _validateIntervalDuration(String? value) {
    String trimmedValue = (value ?? '').trim();
    int? seconds = int.tryParse(trimmedValue);
    if (seconds == null || seconds <= 0) {
      return "Must be a positive number.";
    }
    return null;
  }

  void _addInterval() {
    setState(() {
      _enteredIntervals.add(("", ""));
    });
  }

  void _save() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.training == null
            ? "New Training"
            : "Edit ${widget.training!.name}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Training Title"),
                ),
                validator: _validateTitle,
                onSaved: (newValue) {
                  _enteredTitle = newValue!;
                },
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _enteredIntervals.length,
                  itemBuilder: (context, i) => Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    maxLength: 20,
                                    decoration: const InputDecoration(
                                        label: Text("Interval Name")),
                                    validator: _validateIntervalName,
                                    initialValue: _enteredIntervals[i].$1,
                                    onChanged: (newValue) {
                                      _enteredIntervals[i] =
                                          (newValue, _enteredIntervals[i].$2);
                                    },
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_upward),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 4,
                                    decoration: const InputDecoration(
                                        label: Text("Duration (Seconds)")),
                                    validator: _validateIntervalDuration,
                                    initialValue: _enteredIntervals[i].$2,
                                    onChanged: (newValue) {
                                      _enteredIntervals[i] =
                                          (_enteredIntervals[i].$1, newValue);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_downward),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _addInterval,
                    icon: const Icon(Icons.add),
                    label: const Text("Add Interval"),
                  ),
                  ElevatedButton(onPressed: _save, child: const Text("Save")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
