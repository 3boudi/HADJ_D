// file: informationstore.dart
import 'package:flutter/material.dart';
import 'package:arabic_font/arabic_font.dart';
import '../../../../../../../../constants/colors.dart';
import '../models/store_model.dart';

class InformationStore extends StatelessWidget {
  final StoreModel store;

  const InformationStore({super.key, required this.store});

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
              store.name,
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
                      color: store.isOpen ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      store.isOpen ? 'مفتوح' : 'مغلق',
                      style: ArabicTextStyle(
                        arabicFont: ArabicFont.dinNextLTArabic,
                        fontSize: 14,
                        color: store.isOpen ? Colors.green : Colors.red,
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
                      store.location,
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
                // وقت التوصيل - Hardcoded in UI
                _InfoItem(
                  icon: Icons.timer_outlined,
                  title: 'توصيل خلال',
                  value: '20 - 40 د',
                  iconColor: AppColors.primary,
                ),

                // سعر التوصيل - Properly formatted from double
                _InfoItem(
                  icon: Icons.delivery_dining_outlined,
                  title: 'سعر التوصيل',
                  value: _formatDeliveryPrice(store.deliveryPrice),
                  iconColor: AppColors.primary,
                ),

                // التقييم
                _InfoItem(
                  icon: Icons.star,
                  title: 'التقييم',
                  value: '${store.rating} (${store.orderCount})',
                  iconColor: Colors.amber,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to format delivery price
  String _formatDeliveryPrice(double price) {
    if (price == 0.0) {
      return 'مجاناً';
    } else if (price == price.truncateToDouble()) {
      return '${price.toInt()} دج';
    } else {
      return '${price.toStringAsFixed(2)} دج';
    }
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
