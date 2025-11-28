import 'package:flutter/material.dart';
import 'appbar_leading.dart';
import 'appbar_actions.dart';
import 'package:arabic_font/arabic_font.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'الحاج ديليفري',
        style: ArabicTextStyle(
          arabicFont: ArabicFont.dinNextLTArabic,
          color: const Color(0xFFFF6B35),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: const AppbarLeading(), // أصبح للأيسر (الإعدادات)
      actions: const [AppbarActions()], // أصبح لليمين (الملف الشخصي)
    );
  }
}
