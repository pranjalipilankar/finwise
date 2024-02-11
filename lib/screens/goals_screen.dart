import 'package:flutter/material.dart';
import 'package:finwise/models/goals.dart';
import 'package:finwise/data/goals_data.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});
  @override
  State<GoalsScreen> createState() {
    return _GoalsScreenState();
    }
}

class _GoalsScreenState extends State<GoalsScreen> {
  List<Goal> selectedGoals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goals'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
        ),
        itemCount: goals.length,
        itemBuilder: (context, index) {
          final goal = goals[index];
          final isSelected = selectedGoals.contains(goal);
          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedGoals.remove(goal);
                } else {
                  selectedGoals.add(goal);
                }
              });
            },
            child: Card(
              color: isSelected ? Colors.blue[100] : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    goal.imagePath,
                    fit: BoxFit.fill
                    ),
                  const SizedBox(height: 10),
                  Text(goal.title),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.check),
      ),
    );
  }
}