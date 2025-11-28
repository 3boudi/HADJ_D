import 'package:flutter/material.dart';

class StoresModel {
  String? name;
  String? iconPath;
  String? place;
  String? category;
  String? descreption;
  double? stares;
  Color? boxColor;
 
  StoresModel({
    required this.name,
    required this.iconPath,
    required this.place,
    required this.category,
    required this.descreption,
    required this.stares,
    required this.boxColor,
  
});
static List<StoresModel>? getStores() {
     List<StoresModel> stores = [];

    stores.add(
      StoresModel(
        name: 'Pizza Hut',
        iconPath: 'assets/icons/pizza-hut-logo-svgrepo-com.svg',
        place: 'New York',
        category: 'Fast Food',
        descreption: 'Delicious pizza with fresh ingredients',
        stares: 4.5,
        boxColor: Colors.white,
      ),
    );

    stores.add(
      StoresModel(
        name: 'Sushi World',
        iconPath: 'assets/icons/sushi-world-logo-svgrepo-com.svg',
        place: 'San Francisco',
        category: 'Japanese',
        descreption: 'Authentic sushi and sashimi',
        stares: 4.8,
        boxColor: Colors.white,
      ),
    );

    return stores;
}
}
