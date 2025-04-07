// main.dart

import 'package:flutter/material.dart';
import 'core/theme/app_pallete.dart';
import 'feature/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean Architecture',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}

