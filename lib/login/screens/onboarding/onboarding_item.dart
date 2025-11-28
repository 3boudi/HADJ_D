import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../models/onboarding_model.dart';
import 'package:arabic_font/arabic_font.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel page;

  const OnboardingItem({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: page.color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(page.icon, size: 80, color: page.color),
          ),
          const SizedBox(height: 60),
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: ArabicTextStyle(
              arabicFont: ArabicFont.dinNextLTArabic,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            page.description,
            textAlign: TextAlign.center,
            style: ArabicTextStyle(
              arabicFont: ArabicFont.dinNextLTArabic,
              fontSize: 18,
              height: 1.5,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
