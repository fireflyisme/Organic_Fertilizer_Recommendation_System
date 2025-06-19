import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orgfer_recommendation_system/Views/UI/DashboardScreen.dart';
import 'package:orgfer_recommendation_system/Views/UI/Launch_Screen.dart' show LaunchScreen;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      home: LaunchScreen(),
      routes: {
        '/home': (context) => DashboardScreen(),
      },
    );
  }
}
