import 'package:flutter/material.dart';
import 'package:arabic_font/arabic_font.dart';
import '../../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: ArabicTextStyle(
          arabicFont: ArabicFont.dinNextLTArabic,
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
        prefixIcon: Icon(icon, color: AppColors.textSecondary),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.textSecondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorStyle: ArabicTextStyle(
          // ✅ الخط العربي لرسائل الخطأ
          arabicFont: ArabicFont.dinNextLTArabic,
          color: Colors.red,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
  }
}
