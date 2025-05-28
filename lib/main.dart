import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
        colorSchemeSeed: const Color(0xFF2A99E3),
        fontFamily: 'Raleway',
      ),
      home: const DashboardScreen(),
    );
  }
}
