// file: models/store_data_manager.dart
import './store_model.dart';
import './class_item_model.dart';
import './item_model.dart';

class StoreDataManager {
  // تخزين بيانات كل متجر
  static final Map<String, Map<String, dynamic>> _storeData = {
    '1': {
      'store': StoreModel(
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
        isOpen: false, // مغلق
        deliveryPrice: '150 دج',
        isPromoted: true,
        isExclusive: true,
        categories: ['شواء', 'كبدة', 'لحم أحمر'],
      ),
      'classItems': [
        ClassItemModel(id: '1_1', name: 'الكل', storeId: '1'),
        ClassItemModel(id: '1_2', name: 'شواء', storeId: '1'),
        ClassItemModel(id: '1_3', name: 'سندويتش', storeId: '1'),
        ClassItemModel(id: '1_4', name: 'أطباق', storeId: '1'),
      ],
      'items': {
        '1_1': [
          ItemModel(
            id: '1_1_1',
            name: 'سكالوب رويال',
            price: 30.0,
            image: 'assets/images/item1.png',
            category: 'سندويتش',
            isPopular: true,
            description: 'دجاج مقلي مع خبز خاص وصلصة مميزة',
            classItemId: '1_1',
            storeId: '1',
          ),
          ItemModel(
            id: '1_1_2',
            name: 'سكالوب شحمة',
            price: 30.0,
            image: 'assets/images/item2.png',
            category: 'سندويتش',
            isPopular: false,
            description: 'شحمة مشوية مع خضار طازجة',
            classItemId: '1_1',
            storeId: '1',
          ),
        ],
      },
    },
    '2': {
      'store': StoreModel(
        id: '2',
        name: 'حلويات أم وليد',
        specialty: 'حلويات شرقية',
        categoryId: '2',
        location: 'حي النخيل',
        orderCount: 890,
        rating: 4.8, // تقييم عالي
        imageUrl: 'assets/images/store2.png',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 25)),
        updatedAt: DateTime.now(),
        isOpen: true, // مفتوح
        deliveryPrice: '150 دج',
        isPromoted: true,
        isExclusive: false,
        categories: ['حلويات', 'معجنات'],
      ),
      'classItems': [
        ClassItemModel(id: '2_1', name: 'الكل', storeId: '2'),
        ClassItemModel(id: '2_2', name: 'حلويات', storeId: '2'),
        ClassItemModel(id: '2_3', name: 'معجنات', storeId: '2'),
      ],
      'items': {
        '2_1': [
          ItemModel(
            id: '2_1_1',
            name: 'كنافة ناعمة',
            price: 25.0,
            image: 'assets/images/sweet1.png',
            category: 'حلويات',
            isPopular: true,
            description: 'كنافة ناعمة مع قطر',
            classItemId: '2_1',
            storeId: '2',
          ),
        ],
      },
    },
    '3': {
      'store': StoreModel(
        id: '3',
        name: 'سوبر ماركت التوفير',
        specialty: 'سوبرماركت',
        categoryId: '3',
        location: 'حي العليا',
        orderCount: 2100,
        rating: 4.2, // تقييم أقل
        imageUrl: null,
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 40)),
        updatedAt: DateTime.now(),
        isOpen: true, // مفتوح
        deliveryPrice: '150 دج',
        isPromoted: true,
        isExclusive: false,
        categories: ['سوبرماركت', 'خضار', 'فواكه'],
      ),
      'classItems': [
        ClassItemModel(id: '3_1', name: 'الكل', storeId: '3'),
        ClassItemModel(id: '3_2', name: 'خضار', storeId: '3'),
        ClassItemModel(id: '3_3', name: 'فواكه', storeId: '3'),
      ],
      'items': {
        '3_1': [
          ItemModel(
            id: '3_1_1',
            name: 'طماطم طازجة',
            price: 5.0,
            image: 'assets/images/tomato.png',
            category: 'خضار',
            isPopular: true,
            description: 'طماطم طازجة من المزارع المحلية',
            classItemId: '3_1',
            storeId: '3',
          ),
        ],
      },
    },
    '4': {
      'store': StoreModel(
        id: '4',
        name: 'جزارة الأمانة',
        specialty: 'لحوم طازجة',
        categoryId: '5',
        location: 'شارع الثلاثين',
        orderCount: 450,
        rating: 4.9, // تقييم مرتفع جداً
        imageUrl: null,
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        updatedAt: DateTime.now(),
        isOpen: true, // مفتوح
        deliveryPrice: '200 دج',
        isPromoted: false,
        isExclusive: false,
        categories: ['لحوم', 'دجاج'],
      ),
      'classItems': [
        ClassItemModel(id: '4_1', name: 'الكل', storeId: '4'),
        ClassItemModel(id: '4_2', name: 'لحوم', storeId: '4'),
        ClassItemModel(id: '4_3', name: 'دجاج', storeId: '4'),
      ],
      'items': {
        '4_1': [
          ItemModel(
            id: '4_1_1',
            name: 'لحم بقري ممتاز',
            price: 120.0,
            image: 'assets/images/meat.png',
            category: 'لحوم',
            isPopular: true,
            description: 'لحم بقري طازج عالي الجودة',
            classItemId: '4_1',
            storeId: '4',
          ),
        ],
      },
    },
    '5': {
      'store': StoreModel(
        id: '5',
        name: 'مطبخ أم أحمد',
        specialty: 'أكل منزلي',
        categoryId: '6',
        location: 'حي الروضة',
        orderCount: 980,
        rating: 4.7, // تقييم جيد
        imageUrl: 'assets/images/store4.png',
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
        updatedAt: DateTime.now(),
        isOpen: true, // مفتوح
        deliveryPrice: '100 دج',
        isPromoted: true,
        isExclusive: false,
        categories: ['منزلي', 'أكلات شعبية'],
      ),
      'classItems': [
        ClassItemModel(id: '5_1', name: 'الكل', storeId: '5'),
        ClassItemModel(id: '5_2', name: 'أكلات منزلية', storeId: '5'),
        ClassItemModel(id: '5_3', name: 'أطباق شعبية', storeId: '5'),
      ],
      'items': {
        '5_1': [
          ItemModel(
            id: '5_1_1',
            name: 'كسكسي بالخضار',
            price: 50.0,
            image: 'assets/images/couscous.png',
            category: 'أطباق',
            isPopular: true,
            description: 'كسكسي تقليدي مع خضار متنوعة',
            classItemId: '5_1',
            storeId: '5',
          ),
        ],
      },
    },
  };

  // === دوال الحصول على البيانات ===

  // الحصول على متجر
  static StoreModel? getStore(String storeId) {
    final storeData = _storeData[storeId];
    return storeData != null ? storeData['store'] as StoreModel : null;
  }

  // الحصول على أقسام متجر معين
  static List<ClassItemModel> getClassItemsForStore(String storeId) {
    final storeData = _storeData[storeId];
    if (storeData != null) {
      return List<ClassItemModel>.from(storeData['classItems'] ?? []);
    }
    return [];
  }

  // الحصول على عناصر قسم معين
  static List<ItemModel> getItemsForClass(String storeId, String classItemId) {
    final storeData = _storeData[storeId];
    if (storeData != null) {
      final itemsMap = storeData['items'] as Map<String, List<ItemModel>>?;
      if (itemsMap != null && itemsMap.containsKey(classItemId)) {
        return List<ItemModel>.from(itemsMap[classItemId] ?? []);
      }
    }
    return [];
  }

  // الحصول على جميع العناصر لمتجر معين
  static List<ItemModel> getAllItemsForStore(String storeId) {
    final storeData = _storeData[storeId];
    if (storeData != null) {
      final itemsMap = storeData['items'] as Map<String, List<ItemModel>>?;
      if (itemsMap != null) {
        List<ItemModel> allItems = [];
        itemsMap.values.forEach((items) {
          allItems.addAll(items);
        });
        return allItems;
      }
    }
    return [];
  }

  // === دوال التصفية والترتيب ===

  // الحصول على جميع المتاجر مرتبة حسب الأولوية
  static List<StoreModel> getAllStoresSorted() {
    List<StoreModel> stores = _storeData.values
        .map((data) => data['store'] as StoreModel)
        .toList();

    return _sortStores(stores);
  }

  // تصفية المتاجر حسب الفئة مع الترتيب
  static List<StoreModel> getStoresByCategorySorted(String categoryId) {
    List<StoreModel> stores = _storeData.values
        .map((data) => data['store'] as StoreModel)
        .where((store) => store.categoryId == categoryId)
        .toList();

    return _sortStores(stores);
  }

  // الحصول على المتاجر المفتوحة فقط مرتبة حسب التقييم
  static List<StoreModel> getOpenStoresSorted() {
    List<StoreModel> stores = _storeData.values
        .map((data) => data['store'] as StoreModel)
        .where((store) => store.isOpen)
        .toList();

    return _sortByRating(stores);
  }

  // الحصول على المتاجر المغلقة فقط مرتبة حسب التقييم
  static List<StoreModel> getClosedStoresSorted() {
    List<StoreModel> stores = _storeData.values
        .map((data) => data['store'] as StoreModel)
        .where((store) => !store.isOpen)
        .toList();

    return _sortByRating(stores);
  }

  // الحصول على المتاجر المروجة أولاً
  static List<StoreModel> getPromotedStoresSorted() {
    List<StoreModel> stores = _storeData.values
        .map((data) => data['store'] as StoreModel)
        .where((store) => store.isPromoted)
        .toList();

    return _sortStores(stores);
  }

  // الحصول على المتاجر الحصرية
  static List<StoreModel> getExclusiveStoresSorted() {
    List<StoreModel> stores = _storeData.values
        .map((data) => data['store'] as StoreModel)
        .where((store) => store.isExclusive)
        .toList();

    return _sortStores(stores);
  }

  // === دوال المساعدة للترتيب ===

  // ترتيب المتاجر حسب الأولوية: مفتوح > مروج > تقييم عالي
  static List<StoreModel> _sortStores(List<StoreModel> stores) {
    stores.sort((a, b) {
      // 1. أولاً: المتاجر المفتوحة أولاً
      if (a.isOpen && !b.isOpen) return -1;
      if (!a.isOpen && b.isOpen) return 1;

      // 2. ثانياً: المتاجر المروجة أولاً
      if (a.isPromoted && !b.isPromoted) return -1;
      if (!a.isPromoted && b.isPromoted) return 1;

      // 3. ثالثاً: المتاجر الحصرية
      if (a.isExclusive && !b.isExclusive) return -1;
      if (!a.isExclusive && b.isExclusive) return 1;

      // 4. رابعاً: حسب التقييم (من الأعلى للأدنى)
      int ratingComparison = b.rating.compareTo(a.rating);
      if (ratingComparison != 0) return ratingComparison;

      // 5. خامساً: حسب عدد الطلبات (من الأعلى للأدنى)
      return b.orderCount.compareTo(a.orderCount);
    });

    return stores;
  }

  // ترتيب حسب التقييم فقط
  static List<StoreModel> _sortByRating(List<StoreModel> stores) {
    stores.sort((a, b) => b.rating.compareTo(a.rating));
    return stores;
  }

  // ترتيب حسب عدد الطلبات
  static List<StoreModel> _sortByOrderCount(List<StoreModel> stores) {
    stores.sort((a, b) => b.orderCount.compareTo(a.orderCount));
    return stores;
  }

  // === دوال للحصول على مجموعات محددة ===

  // الحصول على أفضل المتاجر (أعلى تقييم ومفتوحة)
  static List<StoreModel> getTopStores({int limit = 5}) {
    List<StoreModel> stores = getAllStoresSorted();
    return stores.take(limit).toList();
  }

  // الحصول على المتاجر القريبة (محاكاة)
  static List<StoreModel> getNearbyStores() {
    // هنا يمكن إضافة منطق تحديد الموقع
    // حالياً نرجع المتاجر المفتوحة مرتبة حسب التقييم
    return getOpenStoresSorted();
  }

  // الحصول على المتاجر الجديدة (حسب تاريخ الإنشاء)
  static List<StoreModel> getNewStores() {
    List<StoreModel> stores = _storeData.values
        .map((data) => data['store'] as StoreModel)
        .toList();

    stores.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return stores;
  }
}
