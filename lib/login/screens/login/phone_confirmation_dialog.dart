import 'package:flutter/material.dart';
import '/../../constants/colors.dart';
import 'package:arabic_font/arabic_font.dart';

class PhoneConfirmationDialog extends StatelessWidget {
  final String phoneNumber;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const PhoneConfirmationDialog({
    super.key,
    required this.phoneNumber,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: AppColors.primary, width: 2),
      ),
      title: Text(
        'تأكيد رقم الهاتف',
        style: ArabicTextStyle(
          arabicFont: ArabicFont.dinNextLTArabic,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'هل أنت متأكد من رقم الهاتف؟',
            style: ArabicTextStyle(
              arabicFont: ArabicFont.dinNextLTArabic,
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            ),
            child: Text(
              phoneNumber,
              style: ArabicTextStyle(
                arabicFont: ArabicFont.dinNextLTArabic,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: onCancel,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.textSecondary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'لا',
                  style: ArabicTextStyle(
                    arabicFont: ArabicFont.dinNextLTArabic,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: onConfirm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'نعم',
                  style: ArabicTextStyle(
                    arabicFont: ArabicFont.dinNextLTArabic,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
