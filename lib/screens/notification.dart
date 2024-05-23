import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fypatucp/constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  // Mock function to simulate fetching notifications
  Future<List<Map<String, dynamic>>> getSampleNotifications() async {
    // Simulate a delay
    await Future.delayed(const Duration(seconds: 2));
    // Return sample data
    return [
      {
        'title': 'Welcome!',
        'body': 'This is your first notification.',
        'timestamp': DateTime.now(),
      },
      {
        'title': 'Update Available',
        'body': 'A new update is available. Please update the app.',
        'timestamp': DateTime.now().subtract(const Duration(days: 1)),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      appBar: AppBar(
        leadingWidth: kIsWeb ? screenWidth * 0.2 : null,
        backgroundColor: kPrimaryDarkColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          splashRadius: 25.0,
          onPressed: () async {
            bool canPop = await Navigator.maybePop(context);
            if (!canPop) {
              // Handle the case when popping the navigator stack is not possible
              // Navigate to appropriate screen based on user role
              // Example:
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => SomeOtherScreen()),
              // );
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 24,
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getSampleNotifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.white)),
            );
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/no_work.png',
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.height * 0.7,
                    ),
                    const Text(
                      'No Notifications Yet',
                      style: TextStyle(color: kPrimaryLightColor),
                    ),
                  ],
                ),
              ),
            );
          } else {
            final notifications = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(top: kIsWeb ? 15 : 0),
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            kIsWeb ? screenWidth * 0.09 : screenWidth * 0.04,
                        vertical: 4),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color(0xFF090909),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notification['body'],
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                const Text(
                                  'seconds ago', // Placeholder for formatted date time
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Text(
                              notification['title'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: kPrimaryLightColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
