// file: classesitemes.dart
import 'package:flutter/material.dart';
import 'package:arabic_font/arabic_font.dart';
import '../../../../../../../../constants/colors.dart';
import '../models/class_item_model.dart';

class ClassItems extends StatelessWidget {
  final List<ClassItemModel> classItems;
  final String selectedId;
  final Function(String) onSelect;

  const ClassItems({
    super.key,
    required this.classItems,
    required this.selectedId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final classItem = classItems[index];
          final isActive = classItem.id == selectedId;

          return GestureDetector(
            onTap: () => onSelect(classItem.id),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(25),
                border: isActive
                    ? null
                    : Border.all(color: const Color(0xFFE0E0E0), width: 1),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Text(
                classItem.name,
                style: ArabicTextStyle(
                  arabicFont: ArabicFont.dinNextLTArabic,
                  color: isActive ? Colors.white : AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: classItems.length,
      ),
    );
  }
}
