import 'package:flutter/material.dart';
import 'appbar_leading.dart';
import 'appbar_actions.dart';
import 'package:arabic_font/arabic_font.dart';
import '../../../../constants/colors.dart';

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
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      backgroundColor: AppColors.background,
      centerTitle: true,
      elevation: 0,
      leading: const AppbarLeading(), // أصبح للأيسر (الإعدادات)
      actions: const [AppbarActions()], // أصبح لليمين (الملف الشخصي)
    );
  }
}
