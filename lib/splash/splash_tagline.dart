import 'package:flutter/material.dart';
import 'package:train/constants/colors.dart';
import 'package:arabic_font/arabic_font.dart';

class SplashTagline extends StatelessWidget {
  const SplashTagline({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ' الأفضل خدمة توصيل في قايس',
      style: ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
        color: AppColors.textSecondary,
        fontSize: 16,
      ),
    );
  }
}
