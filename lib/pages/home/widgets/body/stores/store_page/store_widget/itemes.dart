// file: itemes.dart
import 'package:flutter/material.dart';
import 'package:arabic_font/arabic_font.dart';
import '../../../../../../../../constants/colors.dart';
import '../models/item_model.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;
  final Function() onAddToCart;

  const ItemCard({super.key, required this.item, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
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
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // معلومات المنتج
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // اسم المنتج
                  Text(
                    item.name,
                    style: ArabicTextStyle(
                      arabicFont: ArabicFont.dinNextLTArabic,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // وصف المنتج
                  Text(
                    item.description,
                    style: ArabicTextStyle(
                      arabicFont: ArabicFont.dinNextLTArabic,
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 12),

                  // السعر والعلامات
                  Row(
                    children: [
                      // علامة شائع
                      if (item.isPopular)
                        Row(
                          children: [
                            Icon(
                              Icons.local_fire_department,
                              size: 16,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'شائع',
                              style: ArabicTextStyle(
                                arabicFont: ArabicFont.dinNextLTArabic,
                                fontSize: 12,
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 12),
                          ],
                        ),

                      // السعر
                      Text(
                        '${item.price.toInt()} دج',
                        style: ArabicTextStyle(
                          arabicFont: ArabicFont.dinNextLTArabic,
                          fontSize: 18,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // صورة المنتج مع زر الإضافة
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                // صورة المنتج
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                      image: AssetImage(item.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: item.image.contains('default')
                      ? Center(
                          child: Icon(
                            Icons.fastfood,
                            size: 40,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),

                // زر الإضافة
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white, size: 18),
                    padding: EdgeInsets.zero,
                    onPressed: onAddToCart,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
