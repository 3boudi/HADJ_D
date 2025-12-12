import 'package:flutter/material.dart';
import 'package:arabic_font/arabic_font.dart';
import 'package:train/constants/colors.dart';
import 'storesmodel.dart';

class StoresHorizontalList extends StatefulWidget {
  final String? categoryId;

  const StoresHorizontalList({super.key, this.categoryId});

  @override
  State<StoresHorizontalList> createState() => _StoresHorizontalListState();
}

class _StoresHorizontalListState extends State<StoresHorizontalList> {
  List<StoreModel> stores = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchStores();
  }

  @override
  void didUpdateWidget(StoresHorizontalList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.categoryId != widget.categoryId) {
      _fetchStores();
    }
  }

  Future<void> _fetchStores() async {
    setState(() => isLoading = true);

    await Future.delayed(const Duration(milliseconds: 500));

    List<StoreModel> allStores = StoreModel.getMockStores();

    if (widget.categoryId != null && widget.categoryId != '8') {
      stores = StoreModel.filterByCategory(allStores, widget.categoryId!);
    } else {
      stores = allStores;
    }

    setState(() => isLoading = false);
  }

  // ويدجت لبطاقة المتجر الفردية
  Widget _buildStoreItem(StoreModel store) {
    // نستخدم البيانات الجديدة إذا كانت موجودة
    bool isOpen = store.isOpen ?? true;
    String deliveryPrice = store.deliveryPrice ?? '100 دج';
    bool isPromoted = store.isPromoted ?? true;
    bool isExclusive = store.isExclusive ?? true;
    List<String> categories = store.categories ?? ['شواء', 'كبدة', 'لحم أحمر'];
    String date = '19 juin';
    int likeCount = 88;

    return Container(
      width: MediaQuery.of(context).size.width - 32, // عرض الشاشة ناقص margins
      height: 280,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- الصورة مع البادجات ---
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
              bottom: Radius.circular(20),
            ),
            child: Stack(
              children: [
                // صورة المتجر
                SizedBox(
                  height: 140, // تم تغيير الارتفاع إلى 180 كما في التصميم
                  width: double.infinity,
                  child: Image.asset(
                    store.displayImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Image.asset(
                          'assets/images/hadjADS.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  ),
                ),

                // البادجات (العلامات) في الزاوية اليمنى العليا (RTL)
                Positioned(
                  right: 12, // تغيير من left إلى right
                  top: 12,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end, // تغيير من start إلى end
                    children: [
                      if (isPromoted) _buildBadge('🚀 مرو', Colors.orange),
                      const SizedBox(height: 6),
                      if (isExclusive) _buildBadge('💎 حصري', Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- معلومات المتجر ---
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // اسم المتجر
                  Text(
                    store.name,
                    style: ArabicTextStyle(
                      arabicFont: ArabicFont.dinNextLTArabic,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // حالة المتجر والفئات
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // تغيير من end إلى start
                    children: [
                      Text(
                        isOpen ? 'مفتوح' : 'مغلق',
                        style: ArabicTextStyle(
                          arabicFont: ArabicFont.dinNextLTArabic,
                          fontSize: 14,
                          color: isOpen ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text('•'),

                      // عرض الفئات
                      ...List.generate(categories.length, (index) {
                        return Row(
                          children: [
                            const SizedBox(width: 5),
                            Text(
                              categories[index],
                              style: ArabicTextStyle(
                                arabicFont: ArabicFont.dinNextLTArabic,
                                fontSize: 14,
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (index < categories.length - 1) ...[
                              const SizedBox(width: 10),
                              const Text('•'),
                            ],
                          ],
                        );
                      }),
                    ],
                  ),
                  // سعر التوصيل والتقييم
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // سعر التوصيل
                      Row(
                        children: [
                          Icon(
                            Icons.delivery_dining,
                            size: 18,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'سعر التوصيل: $deliveryPrice',
                            style: ArabicTextStyle(
                              arabicFont: ArabicFont.dinNextLTArabic,
                              fontSize: 14,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // التقييم
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '${store.rating} (${store.orderCount})',
                              style: const ArabicTextStyle(
                                arabicFont: ArabicFont.dinNextLTArabic,
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ), // التاريخ وعدد الإعجابات
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ويدجت للبادجة (العلامة)
  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: ArabicTextStyle(
          arabicFont: ArabicFont.dinNextLTArabic,
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان القسم
          Padding(
            padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
            child: Text(
              widget.categoryId != null ? 'المتاجر حسب الفئة' : 'جميع المتاجر',
              style: ArabicTextStyle(
                arabicFont: ArabicFont.dinNextLTArabic,
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // عرض المتاجر في قائمة أفقية
          if (isLoading)
            Container(
              height: 300,
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            )
          else if (stores.isEmpty)
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/hadjADS.png',
                        height: 60,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.categoryId != null
                          ? 'لا توجد متاجر في هذه الفئة'
                          : 'لا توجد متاجر متاحة حالياً',
                      style: ArabicTextStyle(
                        arabicFont: ArabicFont.dinNextLTArabic,
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          else
            SizedBox(
              height: 300, // ارتفاع القائمة الأفقية
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stores.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  return _buildStoreItem(stores[index]);
                },
              ),
            ),
        ],
      ),
    );
  }
}
