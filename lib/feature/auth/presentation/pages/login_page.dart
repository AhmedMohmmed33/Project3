// lib/feature/auth/presentation/pages/login_page.dart

import 'package:flutter/material.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Widget spacer() {
    return const SizedBox(height: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spacer(),
            Text('Hello, Welcome Back!', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 12),
            Text('Sign in to continue.', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 40),
            TextField(obscureText: true, decoration: InputDecoration(labelText: 'Name')),
            const SizedBox(height: 10),
            TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password')),
            const SizedBox(height: 5.0),
            TextButton(onPressed: () {}, child: const Text('Forgot Password?', style: TextStyle(color: Colors.black))),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: const Text('Log in', style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Don't have an account?", style: Theme.of(context).textTheme.titleMedium),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpPage()),
                          );
                        },
                        child: const Text('Signup !', style: TextStyle(color: Colors.black)),
                      ),  
                    ],
                  ),
                ], 
              ),    
            ),
          ],
        ),
      ),
    );
  }
}
