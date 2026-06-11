import 'package:flutter/material.dart';
import 'package:trilink_assignment/api_int/screen/api_screen.dart';
import 'package:trilink_assignment/login/screen/login_screen.dart';
import 'package:trilink_assignment/profile/screens/profile_screen.dart';
import 'package:trilink_assignment/to_do_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: const Text('Task 1 - Profile Page Design'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Task 2 - Login Page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ApiScreen(),
                  ),
                );
              },
              child: const Text('Task 3 - API Integration'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ToDoApp()),
                );
              },
              child: const Text('Task 4 - To-Do CRUD App'),
            ),
          ],
        ),
      ),
    );
  }
}
