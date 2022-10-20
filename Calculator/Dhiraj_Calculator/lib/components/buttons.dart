import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButtons extends StatelessWidget {
  String buttonName ;
  Color buttonTextColor ;
  final VoidCallback onPress;

  CalculatorButtons({required this.buttonName, this.buttonTextColor = const Color(0xFF26E6C3), required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3.0),
          // padding: EdgeInsets.all(8.0),
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              color: Color(0xFF272B33),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text(
                buttonName,
                style: GoogleFonts.oswald(
                    textStyle: TextStyle(
                      fontSize: 40.0,
                      color: buttonTextColor,
                    )
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
