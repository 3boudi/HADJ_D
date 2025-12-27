// file: stores_horizontal_list.dart
import 'package:flutter/material.dart';
import 'package:arabic_font/arabic_font.dart';
import 'package:train/constants/colors.dart';
import 'package:train/pages/home/widgets/body/category/categorymodel.dart';
import 'package:lottie/lottie.dart';
import 'store_page/models/store_data_manager.dart';
import 'store_page/storepage.dart';
import 'store_page/models/store_model.dart';

class StoresHorizontalList extends StatefulWidget {
  final String? categoryId;
  final String? sortBy; // إضافة معيار الترتيب

  const StoresHorizontalList({
    super.key,
    this.categoryId,
    this.sortBy = 'default', // default, rating, open, promoted
  });

  @override
  State<StoresHorizontalList> createState() => _StoresHorizontalListState();
}

class _StoresHorizontalListState extends State<StoresHorizontalList> {
  List<StoreModel> stores = [];
  bool isLoading = true;
  final Set<String> _precachedImages = {};

  @override
  void initState() {
    super.initState();
    _fetchStores();
  }

  @override
  void didUpdateWidget(StoresHorizontalList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.categoryId != widget.categoryId ||
        oldWidget.sortBy != widget.sortBy) {
      _fetchStores();
    }
  }

  Future<void> _fetchStores() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));

    if (widget.categoryId != null && widget.categoryId != '11') {
      stores = StoreDataManager.getStoresByCategorySorted(widget.categoryId!);
    } else {
      stores = StoreDataManager.getAllStoresSorted();
    }

    // تطبيق الترتيب الإضافي إذا طلب
    _applySorting();

    // Precache images for smoother transitions
    _precacheStoreImages();

    setState(() => isLoading = false);
  }

  void _precacheStoreImages() {
    for (var store in stores) {
      if (!_precachedImages.contains(store.id)) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          precacheImage(
            AssetImage(store.displayImage),
            context,
            onError: (exception, stackTrace) {
              // If main image fails, preload the default image
              precacheImage(
                const AssetImage('assets/images/hadjADS.png'),
                context,
              );
            },
          );
          _precachedImages.add(store.id);
        });
      }
    }
  }

  void _applySorting() {
    switch (widget.sortBy) {
      case 'rating':
        stores.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'open':
        // المتاجر المفتوحة أولاً
        stores.sort((a, b) {
          if (a.isOpen && !b.isOpen) return -1;
          if (!a.isOpen && b.isOpen) return 1;
          return b.rating.compareTo(a.rating);
        });
        break;
      case 'promoted':
        // المتاجر المروجة أولاً
        stores.sort((a, b) {
          if (a.isPromoted && !b.isPromoted) return -1;
          if (!a.isPromoted && b.isPromoted) return 1;
          return b.rating.compareTo(a.rating);
        });
        break;
      case 'new':
        // المتاجر الجديدة أولاً
        stores.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      default:
        // الإبقاء على الترتيب الافتراضي من getStoresByCategorySorted
        break;
    }
  }

  Widget _buildStoreItem(StoreModel store) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StorePage(storeId: store.id),
            fullscreenDialog: false,
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        height: 280,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصورة مع البادجات
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(20),
              ),
              child: Stack(
                children: [
                  // صورة المتجر مع Hero Animation
                  SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: Hero(
                      tag: 'store-image-${store.id}',
                      createRectTween: (begin, end) {
                        return MaterialRectCenterArcTween(
                          begin: begin,
                          end: end,
                        );
                      },
                      flightShuttleBuilder:
                          (
                            BuildContext flightContext,
                            Animation<double> animation,
                            HeroFlightDirection flightDirection,
                            BuildContext fromHeroContext,
                            BuildContext toHeroContext,
                          ) {
                            // This widget appears during the transition
                            final Widget hero =
                                flightDirection == HeroFlightDirection.push
                                ? fromHeroContext.widget
                                : toHeroContext.widget;

                            return AnimatedBuilder(
                              animation: animation,
                              builder: (context, child) {
                                return FadeTransition(
                                  opacity: animation.drive(
                                    CurveTween(curve: Curves.easeInOut),
                                  ),
                                  child: child,
                                );
                              },
                              child: hero,
                            );
                          },
                      child: Material(
                        type: MaterialType.transparency,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            store.displayImage,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/hadjADS.png',
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  // البادجات
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (store.isPromoted)
                          _buildBadge('⭐️ مروج', Colors.amber),
                        const SizedBox(height: 6),
                        if (store.isExclusive)
                          _buildBadge('💎 حصري', Colors.blue),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // معلومات المتجر
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // اسم المتجر مع أيقونة الحالة
                    Row(
                      children: [
                        Expanded(
                          child: Text(
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
                        ),
                      ],
                    ),

                    // حالة المتجر والفئات
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: store.isOpen
                                ? Colors.green[50]
                                : Colors.red[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: store.isOpen ? Colors.green : Colors.red,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            store.isOpen ? 'مفتوح' : 'مغلق',
                            style: ArabicTextStyle(
                              arabicFont: ArabicFont.dinNextLTArabic,
                              fontSize: 15,
                              color: store.isOpen ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text('•'),

                        // عرض الفئات
                        ...List.generate(store.categories.length, (index) {
                          return Row(
                            children: [
                              const SizedBox(width: 5),
                              Text(
                                store.categories[index],
                                style: ArabicTextStyle(
                                  arabicFont: ArabicFont.dinNextLTArabic,
                                  fontSize: 14,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (index < store.categories.length - 1) ...[
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
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'سعر التوصيل: ${store.deliveryPrice.toInt()}دج',
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
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 16,
                              ),
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
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            store.location,
                            style: ArabicTextStyle(
                              arabicFont: ArabicFont.dinNextLTArabic,
                              fontSize: 14,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
    String categoryName = '';
    if (widget.categoryId != null) {
      final categories = CategoryModel.getCategories();
      try {
        final category = categories.firstWhere(
          (c) => c.id == widget.categoryId,
        );
        categoryName = category.name;
      } catch (e) {
        // Category not found
      }
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان القسم
          Padding(
            padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
            child: Text(
              widget.categoryId != null
                  ? 'المتاجر في قسم "$categoryName"'
                  : 'جميع المتاجر',
              style: ArabicTextStyle(
                arabicFont: ArabicFont.dinNextLTArabic,
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // عرض المتاجر
          if (isLoading)
            Container(
              height: 300,
              child: Center(
                child: Lottie.asset(
                  'assets/lottie/loading.json',
                  width: 100,
                  height: 100,
                ),
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
              height: 300,
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
