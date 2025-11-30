import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../models/onboarding_model.dart';
import 'package:arabic_font/arabic_font.dart';
import 'package:lottie/lottie.dart';

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
            width: 260,
            height: 260,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: page.image != null
                ? Image.asset(page.image!, fit: BoxFit.contain)
                : page.networkImage != null
                ? Lottie.asset(page.networkImage!, fit: BoxFit.contain)
                : const SizedBox(),
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
