import 'package:flutter/material.dart';
import 'package:fypatucp/constants.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  // Dummy data for tasks
  final List<Map<String, dynamic>> tasks = const [
    {'title': 'Task 1', 'details': 'Task 1 details...', 'progress': 0.1},
    {'title': 'Task 2', 'details': 'Task 2 details...', 'progress': 0.5},
    {'title': 'Task 3', 'details': 'Task 3 details...', 'progress': 0.9},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
        title: const Text(
          'Tasks',
          style: TextStyle(color: kPrimaryLightColor),
        ),
        iconTheme:
            const IconThemeData(color: Colors.white), // Set icon color to white
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryLightColor, kPrimaryDarkColor],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task['title'],
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        task['details'],
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const Divider(thickness: 1.0),
                      const SizedBox(height: 10.0),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TaskProgressBar(tasks: tasks),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskProgressBar extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;

  const TaskProgressBar({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (int i = 0; i < tasks.length; i += 3)
          Row(
            children: [
              for (int j = i; j < i + 3 && j < tasks.length; j++)
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        height: 40.0,
                        child: Stack(
                          children: [
                            Container(
                              height: 40.0,
                              color: const Color(0xFFBBC4C2),
                              width: MediaQuery.of(context).size.width,
                            ),
                            Positioned.fill(
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: tasks[j]['progress'],
                                child: Container(
                                  height: 40.0,
                                  color: const Color(0xFF7E7C73),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  tasks[j]['title'],
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryDarkColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                    ],
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
