import 'package:flutter/material.dart';
import 'package:train/constants/colors.dart';
import 'package:arabic_font/arabic_font.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'الحاج ديليفري',
      style: ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
        color: AppColors.textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
