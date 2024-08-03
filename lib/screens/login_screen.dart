import 'package:flutter/material.dart';
import 'package:login_page_ui/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _isEmailVerified = false;

  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkEmailValidity);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _checkEmailValidity() {
    final email = _emailController.text;
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    setState(() {
      _isEmailVerified = emailRegex.hasMatch(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final padding = screenWidth * 0.05;
    final fontSize = screenWidth * 0.05;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          iconSize: 20,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.08),
            Text(
              'Welcome\nBack',
              style: TextStyle(
                fontSize: fontSize * 2.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: screenHeight * 0.2),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                label: const Text('Email'),
                suffixIcon: IconButton(
                  onPressed: () {
                    _checkEmailValidity();
                  },
                  icon: Icon(_isEmailVerified ? Icons.check : null),
                  color: _isEmailVerified ? Colors.green : null,
                ),
                hintText: 'username@example.com',
                prefixIcon: const Icon(Icons.email_outlined),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                label: const Text(
                  'Password',
                ),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {
                    _togglePasswordVisibility();
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Forgot password?',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.surface,
              ),
              onPressed: () {
                //handle this logic
              },
              child: Text(
                'Log in',
                style: TextStyle(fontSize: fontSize),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            const Row(
              children: [
                Expanded(
                  child: Divider(color: Colors.grey, thickness: 1.0),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('or'),
                ),
                Expanded(
                  child: Divider(color: Colors.grey, thickness: 1.0),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.teal,
              ),
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
            SizedBox(height: screenHeight * 0.04),
          ],
        ),
      ),
    );
  }
}
