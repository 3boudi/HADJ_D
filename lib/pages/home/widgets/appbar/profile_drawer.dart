import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arabic_font/arabic_font.dart';
import 'package:train/constants/colors.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/icons/user-svgrepo-com.svg',
                  height: 80,
                  width: 80,
                ),
                const SizedBox(height: 8),
                Text(
                  'أمين',
                  style: ArabicTextStyle(
                    arabicFont: ArabicFont.dinNextLTArabic,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'amine@example.com',
                  style: ArabicTextStyle(
                    arabicFont: ArabicFont.dinNextLTArabic,
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  icon: Icons.person,
                  title: 'الملف الشخصي',
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: Icons.settings,
                  title: 'الإعدادات',
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: Icons.history,
                  title: 'السجل',
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: Icons.help,
                  title: 'المساعدة',
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: Icons.logout,
                  title: 'تسجيل الخروج',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        title,
        style: ArabicTextStyle(
          arabicFont: ArabicFont.dinNextLTArabic,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
    );
  }
}
