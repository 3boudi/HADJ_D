import 'package:flutter/material.dart';
import 'package:arabic_font/arabic_font.dart';
import 'package:train/constants/colors.dart';

class SittingDrawer extends StatelessWidget {
  const SittingDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.orange,
            child: Center(
              child: Text(
                'الإعدادات',
                style: ArabicTextStyle(
                  arabicFont: ArabicFont.dinNextLTArabic,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildSettingsItem(
                  icon: Icons.language,
                  title: 'اللغة',
                  subtitle: 'العربية',
                ),
                _buildSettingsItem(
                  icon: Icons.notifications,
                  title: 'الإشعارات',
                  subtitle: 'مفعل',
                ),
                _buildSettingsItem(
                  icon: Icons.security,
                  title: 'الخصوصية',
                  subtitle: 'إدارة البيانات',
                ),
                _buildSettingsItem(
                  icon: Icons.help_center,
                  title: 'المساعدة والدعم',
                  subtitle: 'الأسئلة الشائعة',
                ),
                _buildSettingsItem(
                  icon: Icons.info,
                  title: 'عن التطبيق',
                  subtitle: 'الإصدار 1.0.0',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(
        title,
        style: ArabicTextStyle(
          arabicFont: ArabicFont.dinNextLTArabic,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: ArabicTextStyle(
          arabicFont: ArabicFont.dinNextLTArabic,
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
      trailing: const Icon(Icons.arrow_left, color: Colors.grey),
      onTap: () {},
    );
  }
}
