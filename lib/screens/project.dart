import 'package:flutter/material.dart';
import 'package:fypatucp/constants.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key});

  // Dummy data for current project and last completed project
  final String currentProjectName = 'Project A';
  final String currentProjectDetails = 'Project A details...';
  final String lastCompletedName = 'Project B';
  final String lastCompletedDetails = 'Project B details...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
        title: const Text(
          'Projects',
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Current Project:',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                currentProjectName,
                style: const TextStyle(fontSize: 16.0),
              ),
              const Divider(thickness: 1.0),
              const SizedBox(height: 10.0),
              const Text(
                'Last Completed:',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                lastCompletedName,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
