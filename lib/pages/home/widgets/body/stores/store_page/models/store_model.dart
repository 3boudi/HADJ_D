// file: models/store_model.dart

class StoreModel {
  final String id;
  final String name;
  final String specialty;
  final String categoryId;
  final String location;
  final int orderCount;
  final double rating;
  final String? imageUrl;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isOpen;
  final double deliveryPrice;
  final bool isPromoted;
  final bool isExclusive;
  final List<String> categories;

  StoreModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.categoryId,
    required this.location,
    required this.orderCount,
    required this.rating,
    this.imageUrl,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.isOpen = true,
    this.deliveryPrice = 100,
    this.isPromoted = false,
    this.isExclusive = false,
    this.categories = const [], // أصبحت قابلة للتعديل
  });

  String get displayImage => imageUrl ?? 'assets/images/hadjADS.png';
  bool get isValidCategory => categoryId != '11';

  // معلومات المتجر للصفحة الرئيسية
  Map<String, dynamic> toInfoMap() {
    return {
      'id': id,
      'name': name,
      'rating': rating,
      'orderCount': orderCount,
      'deliveryPrice': deliveryPrice,
      'isOpen': isOpen,
      'location': location,
      'image': displayImage,
      'isPromoted': isPromoted,
      'isExclusive': isExclusive,
      'categories': categories,
    };
  }
}
