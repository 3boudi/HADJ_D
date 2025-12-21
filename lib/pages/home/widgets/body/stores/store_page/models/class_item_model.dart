// file: models/class_item_model.dart
class ClassItemModel {
  final String id;
  final String name;
  final String storeId; // مفتاح أجنبي لـ Store

  ClassItemModel({required this.id, required this.name, required this.storeId});

  factory ClassItemModel.fromMap(Map<String, dynamic> map) {
    return ClassItemModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      storeId: map['storeId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'storeId': storeId};
  }

  // تم إزالة الدالة الثابتة getClassItemsForStore
  // لأنها كانت ترجع نفس الأقسام لجميع المحلات
}
