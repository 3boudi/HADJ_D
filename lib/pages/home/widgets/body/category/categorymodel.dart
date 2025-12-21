// file: models/category_model.dart
import 'package:flutter/material.dart';
import 'package:train/constants/colors.dart';

class CategoryModel {
  final String id;
  final String name;
  final String iconPath;
  final Color boxColor;
  final bool isValidForStores;

  CategoryModel({
    required this.id,
    required this.name,
    required this.iconPath,
    this.boxColor = AppColors.secondary,
    this.isValidForStores = true,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      iconPath: map['iconPath'] ?? 'assets/images/default_category.png',
      isValidForStores: map['isValidForStores'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'iconPath': iconPath,
      'isValidForStores': isValidForStores,
    };
  }

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        id: '1',
        name: 'مطاعم',
        iconPath: 'assets/images/resturant.png',
      ),
      CategoryModel(
        id: '2',
        name: 'حلويات',
        iconPath: 'assets/images/sweets.png',
      ),
      CategoryModel(
        id: '3',
        name: 'سوبرماركت',
        iconPath: 'assets/images/supermarket.png',
      ),
      CategoryModel(
        id: '4',
        name: 'خضار',
        iconPath: 'assets/images/vegetables.png',
      ),
      CategoryModel(
        id: '5',
        name: 'جزار',
        iconPath: 'assets/images/butcher.png',
      ),
      CategoryModel(
        id: '6',
        name: 'صنع المنزل',
        iconPath: 'assets/images/home-cooking.png',
      ),
      CategoryModel(
        id: '7',
        name: 'محلات متنوعة',
        iconPath: 'assets/images/various-shops.png',
      ),
      CategoryModel(
        id: '8',
        name: 'صيدليات',
        iconPath: 'assets/images/pharmacy.png',
      ),
      CategoryModel(
        id: '9',
        name: 'مكتبات',
        iconPath: 'assets/images/library.png',
      ),
      CategoryModel(
        id: '10',
        name: 'أكشاك',
        iconPath: 'assets/images/kiosk.png',
      ),
      CategoryModel(
        id: '11',
        name: 'اطلب أي شيء',
        iconPath: 'assets/images/anything.png',
        isValidForStores: false,
      ),
    ];
  }
}
