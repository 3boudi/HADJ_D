class AdSlide {
  final String image;
  final String? id; // للربط مع الخلفية في المستقبل
  final Map<String, dynamic>? metadata; // بيانات إضافية للخلفية في المستقبل

  AdSlide({required this.image, this.id, this.metadata});

  // تحويل إلى Map (للخلفية في المستقبل)
  Map<String, dynamic> toMap() {
    return {'id': id, 'image': image, 'metadata': metadata};
  }

  // إنشاء من Map (للخلفية في المستقبل)
  static AdSlide fromMap(Map<String, dynamic> map) {
    return AdSlide(
      id: map['id'],
      image: map['image'],
      metadata: map['metadata'],
    );
  }
}

// فئة لإدارة الإعلانات (يمكن توسيعها للاتصال بالخلفية)
class AdsRepository {
  // قائمة إعلانات افتراضية
  static final List<AdSlide> defaultAds = [
    AdSlide(
      id: '1',
      image: 'assets/images/',
      metadata: {'createdAt': DateTime.now().toString()},
    ),
    AdSlide(
      id: '2',
      image: 'images/image02.png',
      metadata: {'createdAt': DateTime.now().toString()},
    ),
    AdSlide(
      id: '3',
      image: 'images/image03.png',
      metadata: {'createdAt': DateTime.now().toString()},
    ),
    AdSlide(
      id: '4',
      image: 'images/image04.png',
      metadata: {'createdAt': DateTime.now().toString()},
    ),
  ];

  // في المستقبل يمكن إضافة دوال للاتصال بالخادم مثل:
  // Future<List<AdSlide>> fetchAdsFromServer()
  // Future<void> uploadAd(AdSlide ad)
}
