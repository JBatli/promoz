import 'package:flutter/material.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({super.key});

  @override
  CustomerDashboardState createState() => CustomerDashboardState(); // Consider making this StatelessWidget if no state is needed yet
}

class CustomerDashboardState extends State<CustomerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Dashboard')), // Added const for performance
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Welcome, Customer!', // Placeholder customer name
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Your Favorites/Preferences',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Placeholder(fallbackHeight: 100), // Placeholder for favorites/preferences
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/promotions_listing');
              },
              child: Text('View Promotions'),
            ),
          ],
        ),
      ),
    );
  }
}