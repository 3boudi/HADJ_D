import 'dart:ffi';

import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';

Text? validateEmail(bool isLogin, String? value) {
  if (value == null || value.isEmpty)
    return Text(
      'الرجاء إدخال البريد الإلكتروني',
      style: ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
        color: Colors.red,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );

  final emailValid = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  ).hasMatch(value);

  if (!emailValid)
    return Text(
      'خطأ في البريد الإلكتروني',
      style: ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
        color: Colors.red,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  return null;
}

Text? validatePassword(String? value) {
  if (value == null || value.length < 6) {
    return Text(
      'جرب كلمة مرور(6 أحرف على الأقل)',
      style: ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
        color: Colors.red,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  return null;
}

Text? validatePhone(bool isLogin, String? value) {
  if (isLogin) return null;

  if (value == null || value.isEmpty)
    return Text(
      'يرجى إدخال رقم الهاتف',
      style: ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
        color: Colors.red,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );

  final phoneValid = RegExp(r'^(05|06|07)[0-9]{8}$').hasMatch(value);

  if (!phoneValid)
    return Text(
      'خطأ في رقم الهاتف',
      style: ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
        color: Colors.red,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );

  return null;
}

Text? validateName(String? value) {
  if (value == null || value.isEmpty)
    return Text(
      'الاسم مطلوب',
      style: ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
        color: Colors.red,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  if (value.length < 3)
    return Text(
      'الاسم  يكون 3 أحرف على الأقل',
      style: ArabicTextStyle(
        arabicFont: ArabicFont.dinNextLTArabic,
        color: Colors.red,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  return null;
}
