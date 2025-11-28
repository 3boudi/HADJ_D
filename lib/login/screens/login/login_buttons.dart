import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'package:arabic_font/arabic_font.dart';

class LoginButtons extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onSubmit;

  const LoginButtons({
    super.key,
    required this.isLogin,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onSubmit,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
        child: Text(
          isLogin ? 'تسجيل الدخول' : 'إنشاء حساب',
          style: ArabicTextStyle(
            arabicFont: ArabicFont.dinNextLTArabic,
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
