// file: informationstore.dart
import 'package:flutter/material.dart';
import 'package:arabic_font/arabic_font.dart';
import '../../../../../../../../constants/colors.dart';

class InformationStore extends StatelessWidget {
  final String storeName;
  final bool isOpen;
  final String deliveryTime;
  final String deliveryPrice;
  final double rating;
  final int ratingCount;
  final String location;

  const InformationStore({
    super.key,
    this.storeName = 'مشاوي سطايغي',
    this.isOpen = true,
    this.deliveryTime = '20 - 40',
    this.deliveryPrice = '200 دج',
    this.rating = 4.28,
    this.ratingCount = 88,
    this.location = 'Juin 19',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اسم المتجر
            Text(
              storeName,
              style: ArabicTextStyle(
                arabicFont: ArabicFont.dinNextLTArabic,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 8),

            // حالة المتجر والموقع
            Row(
              children: [
                // حالة المتجر
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 12,
                      color: isOpen ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isOpen ? 'مفتوح' : 'مغلق',
                      style: ArabicTextStyle(
                        arabicFont: ArabicFont.dinNextLTArabic,
                        fontSize: 14,
                        color: isOpen ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 12),

                // موقع المتجر
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: ArabicTextStyle(
                        arabicFont: ArabicFont.dinNextLTArabic,
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // المعلومات الإضافية
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // وقت التوصيل
                _InfoItem(
                  icon: Icons.timer_outlined,
                  title: 'توصيل خلال',
                  value: '$deliveryTime د',
                  iconColor: AppColors.primary,
                ),

                // سعر التوصيل
                _InfoItem(
                  icon: Icons.delivery_dining_outlined,
                  title: 'سعر التوصيل',
                  value: deliveryPrice,
                  iconColor: AppColors.primary,
                ),

                // التقييم
                _InfoItem(
                  icon: Icons.star,
                  title: 'التقييم',
                  value: '$rating ($ratingCount)',
                  iconColor: Colors.amber,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color iconColor;

  const _InfoItem({
    required this.icon,
    required this.title,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(height: 8),
        Text(
          title,
          style: ArabicTextStyle(
            arabicFont: ArabicFont.dinNextLTArabic,
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: ArabicTextStyle(
            arabicFont: ArabicFont.dinNextLTArabic,
            fontSize: 16,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
