import 'package:flutter/material.dart';
import 'package:train/constants/colors.dart';

class CategoryModel {
  String? id;
  String? name;
  String? iconPath;
  Color? boxColor;

  CategoryModel({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  // خاصية للتحقق مما إذا كانت الفئة صالحة للمتاجر (ليست "اطلب أي شيء")
  bool get isValidForStores => id != '8';

  static List<CategoryModel>? getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        id: '1',
        name: 'مطاعم',
        iconPath: 'assets/icons/restaurant.svg',
        boxColor: AppColors.secondary,
      ),
    );

    categories.add(
      CategoryModel(
        id: '2',
        name: 'حلويات',
        iconPath: 'assets/icons/dessert.svg',
        boxColor: AppColors.secondary,
      ),
    );

    categories.add(
      CategoryModel(
        id: '3',
        name: 'سوبرماركت',
        iconPath: 'assets/icons/supermarket.svg',
        boxColor: AppColors.secondary,
      ),
    );

    categories.add(
      CategoryModel(
        id: '4',
        name: 'خضار',
        iconPath: 'assets/icons/vegetables.svg',
        boxColor: AppColors.secondary,
      ),
    );

    categories.add(
      CategoryModel(
        id: '5',
        name: 'صنع المنزل',
        iconPath: 'assets/icons/home-cooking.svg',
        boxColor: AppColors.secondary,
      ),
    );

    categories.add(
      CategoryModel(
        id: '6',
        name: 'صيدليات',
        iconPath: 'assets/icons/pharmacy.svg',
        boxColor: AppColors.secondary,
      ),
    );

    categories.add(
      CategoryModel(
        id: '7',
        name: 'أكشاك',
        iconPath: 'assets/icons/kiosk.svg',
        boxColor: AppColors.secondary,
      ),
    );

    // فئة "اطلب أي شيء" - هذه الفئة لا يمكن للمتاجر الارتباط بها
    categories.add(
      CategoryModel(
        id: '8',
        name: 'اطلب أي شيء',
        iconPath: 'assets/icons/anything.svg',
        boxColor: AppColors.secondary,
      ),
    );

    return categories;
  }
}
