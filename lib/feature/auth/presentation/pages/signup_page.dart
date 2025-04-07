// lib/feature/auth/presentation/pages/signup_page.dart

// lib/feature/auth/presentation/pages/signup_page.dart

import 'package:flutter/material.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create new Account', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('Already have an account?', style: Theme.of(context).textTheme.titleMedium),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text('Log in', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
            const SizedBox(height: 25),
            TextField(obscureText: true, decoration: InputDecoration(labelText: 'Name')),
            const SizedBox(height: 15),
            TextField(obscureText: true, decoration: InputDecoration(labelText: 'Email')),
            const SizedBox(height: 15),
            TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password')),
            const SizedBox(height: 15),
            TextField(obscureText: true, decoration: InputDecoration(labelText: 'Date of Birth')),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: const Text('Sign up', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
