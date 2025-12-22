// file: storepage.dart
import 'package:flutter/material.dart';
import 'package:arabic_font/arabic_font.dart';
import 'package:train/constants/colors.dart';
import 'store_widget/informationstore.dart';
import 'store_widget/classesitemes.dart';
import 'store_widget/itemes.dart';
import 'store_page/../models/store_data_manager.dart';
import 'store_page/../models/store_model.dart';
import 'store_page/../models/class_item_model.dart';
import 'store_page/../models/item_model.dart';

class StorePage extends StatefulWidget {
  final String storeId;

  const StorePage({super.key, required this.storeId});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late StoreModel? store;
  late List<ClassItemModel> classItems;
  late List<ItemModel> filteredItems;
  late String selectedClassItemId;
  int cartItemCount = 0;
  bool _isImagePrecached = false;

  @override
  void initState() {
    super.initState();
    _loadStoreData();
  }

  void _loadStoreData() {
    store = StoreDataManager.getStore(widget.storeId);
    classItems = StoreDataManager.getClassItemsForStore(widget.storeId);
    selectedClassItemId = classItems.isNotEmpty ? classItems.first.id : '';

    _filterItems();

    // Precache the store image
    if (store != null && !_isImagePrecached) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        precacheImage(
          AssetImage(store!.displayImage),
          context,
          onError: (exception, stackTrace) {
            // Preload default image if store image fails
            precacheImage(
              const AssetImage('assets/images/hadjADS.png'),
              context,
            );
          },
        );
        _isImagePrecached = true;
      });
    }
  }

  void _filterItems() {
    if (selectedClassItemId.endsWith('_1') || selectedClassItemId.isEmpty) {
      // قسم "الكل" - عرض جميع العناصر
      filteredItems = StoreDataManager.getAllItemsForStore(widget.storeId);
    } else {
      // قسم محدد - عرض عناصر القسم فقط
      filteredItems = StoreDataManager.getItemsForClass(
        widget.storeId,
        selectedClassItemId,
      );
    }
  }

  void _onCategorySelected(String categoryId) {
    setState(() {
      selectedClassItemId = categoryId;
      _filterItems();
    });
  }

  void _addToCart(ItemModel item) {
    setState(() {
      cartItemCount++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'تم إضافة ${item.name} إلى السلة',
          style: ArabicTextStyle(arabicFont: ArabicFont.dinNextLTArabic),
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _navigateToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'الانتقال إلى سلة الشراء',
          style: ArabicTextStyle(arabicFont: ArabicFont.dinNextLTArabic),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (store == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              // Hero Image مع الأزرار
              Stack(
                children: [
                  // Hero Image مع Hero Animation
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Hero(
                      tag: 'store-image-${store!.id}',
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
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          child: Image.asset(
                            store!.displayImage,
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

                  // أزرار التحكم
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: AppColors.primary,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.search, color: AppColors.primary),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),

              // معلومات المتجر - Updated to pass the store object
              InformationStore(store: store!),

              // فئات العناصر
              if (classItems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: ClassItems(
                    classItems: classItems,
                    selectedId: selectedClassItemId,
                    onSelect: _onCategorySelected,
                  ),
                ),

              // قائمة العناصر
              Expanded(
                child: filteredItems.isEmpty
                    ? Center(
                        child: Text(
                          'لا توجد عناصر في هذا القسم',
                          style: ArabicTextStyle(
                            arabicFont: ArabicFont.dinNextLTArabic,
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];
                          return ItemCard(
                            item: item,
                            onAddToCart: () => _addToCart(item),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),

        // زر السلة العائم
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: _navigateToCart,
          child: Stack(
            children: [
              Icon(Icons.shopping_cart, color: Colors.white, size: 28),
              if (cartItemCount > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Text(
                      cartItemCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }
}
