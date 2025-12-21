// file: models/item_model.dart
class ItemModel {
  final String id;
  final String name;
  final double price;
  final String image;
  final String category;
  final bool isPopular;
  final String description;
  final String classItemId; // مفتاح أجنبي لـ ClassItem
  final String storeId; // مفتاح أجنبي لـ Store
  final bool isAvailable;
  final int preparationTime;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.isPopular,
    required this.description,
    required this.classItemId,
    required this.storeId,
    this.isAvailable = true,
    this.preparationTime = 15,
  });

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      image: map['image'] ?? 'assets/images/hadjADS.png',
      category: map['category'] ?? '',
      isPopular: map['isPopular'] ?? false,
      description: map['description'] ?? '',
      classItemId: map['classItemId'] ?? '',
      storeId: map['storeId'] ?? '',
      isAvailable: map['isAvailable'] ?? true,
      preparationTime: map['preparationTime'] ?? 15,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'category': category,
      'isPopular': isPopular,
      'description': description,
      'classItemId': classItemId,
      'storeId': storeId,
      'isAvailable': isAvailable,
      'preparationTime': preparationTime,
    };
  }

  // تم إزالة الدالة الثابتة getItemsForStoreAndClass
  // لأنها كانت ترجع نفس العناصر لجميع المحلات
}
