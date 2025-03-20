import 'package:flutter/material.dart';

class AppTypography {
    static const appFont = 'ClearSans';

    static const TextStyle wordStyle = TextStyle(
    color: AppColors.text,
    fontFamily: appFont,
    fontWeight: FontWeight.bold, 
    fontStyle: FontStyle.normal,   
  );
}

class AppColors {
  static const Color primary = Color(0xFF6ca965); 
  static const Color secondary = Color(0xFFc8b653);
  static const Color bgColor = Color(0xFF121213); 
  static const Color text = Color(0xFFFFFFFF); 
  static const Color surface = Color(0xFF3a3a3c);  
  static const Color card = Color(0xFF787c7f); 
}
