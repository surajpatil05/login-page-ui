import 'package:flutter/material.dart';
import 'package:login_page_ui/screens/signup_screen.dart';
import 'package:login_page_ui/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final padding = screenWidth * 0.05;
    final fontSize = screenWidth * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Text(
              'App Use',
              style: TextStyle(
                fontSize: fontSize * 2.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'this is a basic login Ui Welcome Screen when the app starts it show this screen at first',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 85, 85, 85),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.teal,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const LoginScreen(),
                  ),
                );
              },
              child: Text(
                'Log in',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const SignupScreen(),
                  ),
                );
              },
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
        ],
      ),
    );
  }
}
