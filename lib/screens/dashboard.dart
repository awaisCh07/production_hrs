import 'package:flutter/material.dart';
import 'package:fypatucp/constants.dart';

// fetch the user name Admin or User
String user = 'Lorem Ipsum';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: kPrimaryLightColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/notification');
            },
            icon: const Icon(Icons.notifications),
          ),
          Image.asset('assets/images/prd-logo.png'),
        ],
        iconTheme:
            const IconThemeData(color: Colors.white), // Set icon color to white
      ),
      drawer: Drawer(
        // Add your drawer content here
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kPrimaryLightColor, kPrimaryDarkColor],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text('Drawer Content'),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Handle button 1 press
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: kPrimaryLightColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    backgroundColor: kPrimaryDarkColor,
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: kPrimaryLightColor),
                  ),
                ),
                const SizedBox(height: 100.0),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryLightColor, Colors.black87],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Productive Hour',
              style: TextStyle(
                  color: kPrimaryDarkColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 80),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kPrimaryLightColor, Colors.black87],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    user,
                    style: const TextStyle(fontSize: 30.0),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.12,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle button 1 press
                            Navigator.pushNamed(context, '/task');
                          },
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(color: kPrimaryLightColor),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: kPrimaryDarkColor,
                          ),
                          child: const Text(
                            'Task',
                            style: TextStyle(color: kPrimaryLightColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.12,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle button 2 press
                            Navigator.pushNamed(context, '/project');
                          },
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(color: kPrimaryLightColor),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: kPrimaryDarkColor,
                          ),
                          child: const Text(
                            'Project',
                            style: TextStyle(color: kPrimaryLightColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 150.0,
            ),
          ],
        ),
      ),
    );
  }
}
