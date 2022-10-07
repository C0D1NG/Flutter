import 'package:flutter/material.dart';
import 'package:nehal_music/screens/play_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nehal_music',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: const PlayScreen(),
    );
  }
}
