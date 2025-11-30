import 'package:flutter/material.dart';
import 'package:train/constants/colors.dart';

class CategoryModel {
  String? name;
  String? iconPath;
  Color? boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel>? getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'مطاعم',
        iconPath: 'assets/icons/restaurant.svg',
        boxColor: AppColors.primary,
      ),
    );

    categories.add(
      CategoryModel(
        name: 'حلويات',
        iconPath: 'assets/icons/dessert.svg',
        boxColor: AppColors.primary,
      ),
    );

    categories.add(
      CategoryModel(
        name: 'سوبرماركت',
        iconPath: 'assets/icons/supermarket.svg',
        boxColor: AppColors.primary,
      ),
    );

    categories.add(
      CategoryModel(
        name: 'خضار',
        iconPath: 'assets/icons/vegetables.svg',
        boxColor: AppColors.primary,
      ),
    );

    categories.add(
      CategoryModel(
        name: 'صنع المنزل',
        iconPath: 'assets/icons/home-cooking.svg',
        boxColor: AppColors.primary,
      ),
    );

    categories.add(
      CategoryModel(
        name: 'صيدليات',
        iconPath: 'assets/icons/pharmacy.svg',
        boxColor: AppColors.primary,
      ),
    );

    categories.add(
      CategoryModel(
        name: 'أكشاك',
        iconPath: 'assets/icons/kiosk.svg',
        boxColor: AppColors.primary,
      ),
    );

    categories.add(
      CategoryModel(
        name: 'اطلب أي شيء',
        iconPath: 'assets/icons/anything.svg',
        boxColor: AppColors.primary,
      ),
    );

    return categories;
  }
}
