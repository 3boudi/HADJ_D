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

  // الحقول الجديدة
  final bool isOpen;
  final String deliveryPrice;
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
    this.deliveryPrice = '100 دج',
    this.isPromoted = false,
    this.isExclusive = false,
    this.categories = const [],
  });

  String get displayImage => imageUrl ?? 'assets/images/default_store.png';

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      specialty: map['specialty'] ?? '',
      categoryId: map['categoryId'] ?? '',
      location: map['location'] ?? '',
      orderCount: map['orderCount'] ?? 0,
      rating: (map['rating'] ?? 0.0).toDouble(),
      imageUrl: map['imageUrl'],
      isActive: map['isActive'] ?? true,
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toString()),
      updatedAt: DateTime.parse(map['updatedAt'] ?? DateTime.now().toString()),
      isOpen: map['isOpen'] ?? true,
      deliveryPrice: map['deliveryPrice'] ?? '100 دج',
      isPromoted: map['isPromoted'] ?? false,
      isExclusive: map['isExclusive'] ?? false,
      categories: List<String>.from(map['categories'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'specialty': specialty,
      'categoryId': categoryId,
      'location': location,
      'orderCount': orderCount,
      'rating': rating,
      'imageUrl': imageUrl,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isOpen': isOpen,
      'deliveryPrice': deliveryPrice,
      'isPromoted': isPromoted,
      'isExclusive': isExclusive,
      'categories': categories,
    };
  }

  StoreModel copyWith({
    String? id,
    String? name,
    String? specialty,
    String? categoryId,
    String? location,
    int? orderCount,
    double? rating,
    String? imageUrl,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isOpen,
    String? deliveryPrice,
    bool? isPromoted,
    bool? isExclusive,
    List<String>? categories,
  }) {
    return StoreModel(
      id: id ?? this.id,
      name: name ?? this.name,
      specialty: specialty ?? this.specialty,
      categoryId: categoryId ?? this.categoryId,
      location: location ?? this.location,
      orderCount: orderCount ?? this.orderCount,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isOpen: isOpen ?? this.isOpen,
      deliveryPrice: deliveryPrice ?? this.deliveryPrice,
      isPromoted: isPromoted ?? this.isPromoted,
      isExclusive: isExclusive ?? this.isExclusive,
      categories: categories ?? this.categories,
    );
  }

  static List<StoreModel> getMockStores() {
    return [
      StoreModel(
        id: '1',
        name: 'منشاوي سطايغي',
        specialty: 'وجبات سريعة',
        categoryId: '1',
        location: 'ساحة 8 ماي 1945',
        orderCount: 88,
        rating: 4.3,
        imageUrl: 'assets/images/store1.png',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        updatedAt: DateTime.now(),
        isOpen: true,
        deliveryPrice: '100 دج',
        isPromoted: true,
        isExclusive: true,
        categories: ['شواء', 'كبدة', 'لحم أحمر'],
      ),
      StoreModel(
        id: '2',
        name: 'حلويات أم وليد',
        specialty: 'حلويات شرقية',
        categoryId: '2',
        location: 'حي النخيل، جدة',
        orderCount: 890,
        rating: 4.8,
        imageUrl: 'assets/images/store2.png',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 25)),
        updatedAt: DateTime.now(),
        isOpen: true,
        deliveryPrice: '150 دج',
        isPromoted: true,
        isExclusive: false,
        categories: ['حلويات', 'معجنات'],
      ),
      StoreModel(
        id: '3',
        name: 'سوبر ماركت التوفير',
        specialty: 'سوبرماركت',
        categoryId: '3',
        location: 'حي العليا، الرياض',
        orderCount: 2100,
        rating: 4.2,
        imageUrl: null,
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 40)),
        updatedAt: DateTime.now(),
        isOpen: true,
        deliveryPrice: '50 دج',
        isPromoted: true,
        isExclusive: false,
        categories: ['سوبرماركت', 'خضار', 'فواكه'],
      ),
      StoreModel(
        id: '4',
        name: 'خضار طازج',
        specialty: 'خضار وفواكه',
        categoryId: '4',
        location: 'سوق الخضار المركزي، الدمام',
        orderCount: 1560,
        rating: 4.6,
        imageUrl: 'assets/images/store3.png',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 20)),
        updatedAt: DateTime.now(),
        isOpen: true,
        deliveryPrice: '80 دج',
        isPromoted: false,
        isExclusive: true,
        categories: ['خضار', 'فواكه'],
      ),
      StoreModel(
        id: '5',
        name: 'أم أحمد للمأكولات',
        specialty: 'مأكولات منزلية',
        categoryId: '5',
        location: 'حي الروضة، المدينة',
        orderCount: 980,
        rating: 4.9,
        imageUrl: 'assets/images/store4.png',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
        updatedAt: DateTime.now(),
        isOpen: true,
        deliveryPrice: '120 دج',
        isPromoted: true,
        isExclusive: false,
        categories: ['منزلي', 'أكلات شعبية'],
      ),
      StoreModel(
        id: '6',
        name: 'صيدلية الحياة',
        specialty: 'أدوية ومستلزمات',
        categoryId: '6',
        location: 'حي السلام، أبها',
        orderCount: 650,
        rating: 4.4,
        imageUrl: 'assets/images/store5.png',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 35)),
        updatedAt: DateTime.now(),
        isOpen: true,
        deliveryPrice: '200 دج',
        isPromoted: false,
        isExclusive: false,
        categories: ['صيدلية', 'مستلزمات طبية'],
      ),
    ];
  }

  static List<StoreModel> filterByCategory(
    List<StoreModel> stores,
    String categoryId,
  ) {
    return stores.where((store) => store.categoryId == categoryId).toList();
  }

  bool get isValidCategory => categoryId != '8';
}
