import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

void main() {
  runApp(const TiktokApp());
}

class TiktokApp extends StatefulWidget {
  const TiktokApp({super.key});

  @override
  State<TiktokApp> createState() => _TiktokAppState();
}

class _TiktokAppState extends State<TiktokApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticktok Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xffe9435a),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const InterestsScreen(),
    );
  }
}
