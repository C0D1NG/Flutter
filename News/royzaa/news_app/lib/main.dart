import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './landing_screen.dart';
import './utlis/secure_storage.dart';
import 'secret.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SecureStorage.init();
  SecureStorage.storeKey(tag, apiKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News View Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: const Color.fromRGBO(108, 99, 255, 1),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const LandingScreen(),
    );
  }
}
