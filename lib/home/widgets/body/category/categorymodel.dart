import 'package:flutter/material.dart';

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
        name: 'Fast Food',
        iconPath: 'assets/icons/user-svgrepo-com.svg',
        boxColor: Color.fromARGB(255, 255, 68, 0),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Fast Food',
        iconPath: 'assets/icons/user-svgrepo-com.svg',
        boxColor: Color.fromARGB(255, 255, 68, 0),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Fast Food',
        iconPath: 'assets/icons/user-svgrepo-com.svg',
        boxColor: Color.fromARGB(255, 255, 68, 0),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Fast Food',
        iconPath: 'assets/icons/user-svgrepo-com.svg',
        boxColor: Color.fromARGB(255, 255, 68, 0),
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Fast Food',
        iconPath: 'assets/icons/user-svgrepo-com.svg',
        boxColor: Color.fromARGB(255, 255, 68, 0),
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Fast Food',
        iconPath: 'assets/icons/user-svgrepo-com.svg',
        boxColor: Color.fromARGB(255, 255, 68, 0),
      ),
    );

    return categories;
  }
}
