import 'package:flutter/material.dart';
import 'package:arabic_font/arabic_font.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'طلبات',
          style: ArabicTextStyle(
            arabicFont: ArabicFont.dinNextLTArabic,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
