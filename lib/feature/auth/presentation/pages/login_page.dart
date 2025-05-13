import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showSnackbar("Please fill in all fields");
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.13:5001/api/login'), 
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        showSnackbar("Login Success ✅\nToken: ${data['token']}");
        // Navigate to another page or store the token
      } else {
        final data = jsonDecode(response.body);
        showSnackbar("Login failed ❌\n${data['message']}");
      }
    } catch (e) {
      showSnackbar("Error: $e");
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 3)),
    );
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
            const SizedBox(height: 20),
            Text('Hello, Welcome Back!', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 12),
            Text('Sign in to continue.', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 40),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot Password?', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: const Text('Log in', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            const SizedBox(height: 24),
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
    );
  }
}
