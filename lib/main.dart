import 'package:flutter/material.dart';
import 'package:flutter_flow_bank/pages/intro_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF4B39EF),
          onPrimary: Colors.white,
          secondary: Color(0xFF13209E),
          onSecondary: Color(0xFF535353),
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Color(0xFF4B39EF),
          surface: Colors.white,
          onSurface: Color(0xFF535353),
        ),
      ),
      home: IntroPage(),
    );
  }
}
