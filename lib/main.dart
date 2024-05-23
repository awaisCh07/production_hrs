import 'package:flutter/material.dart';
import 'package:fypatucp/constants.dart';
import 'package:fypatucp/screens/dashboard.dart';
import 'package:fypatucp/screens/login.dart';
import 'package:fypatucp/screens/notification.dart';
import 'package:fypatucp/screens/project.dart';
import 'package:fypatucp/screens/splash.dart';
import 'package:fypatucp/screens/task.dart';
import 'package:fypatucp/screens/welcome.dart';

void main() async {
  await Future.delayed(const Duration(seconds: 3));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'PRD',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryDarkColor),
      //   useMaterial3: true,
      // ),
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const WelcomeScreen();
          } else {
            return const SplashScreen();
          }
        },
      ),
      // initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/task': (context) => const TasksScreen(),
        '/project': (context) => const ProjectsScreen(),
        '/notification': (context) => const NotificationsScreen(),
      },
    );
  }
}
