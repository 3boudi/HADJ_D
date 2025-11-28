import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'package:arabic_font/arabic_font.dart';

class LoginToggle extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onToggleMode;

  const LoginToggle({
    super.key,
    required this.isLogin,
    required this.onToggleMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onToggleMode,
      child: RichText(
        text: TextSpan(
          style: ArabicTextStyle(
            arabicFont: ArabicFont.dinNextLTArabic,
            color: AppColors.textSecondary,
            fontSize: 15,
          ),
          children: [
            TextSpan(text: isLogin ? 'ليس لديك حساب؟ ' : 'لديك حساب بالفعل؟ '),
            TextSpan(
              text: isLogin ? 'سجل الآن' : 'سجل الدخول',
              style: ArabicTextStyle(
                arabicFont: ArabicFont.dinNextLTArabic,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
