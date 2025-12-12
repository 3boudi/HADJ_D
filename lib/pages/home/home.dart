import 'package:flutter/material.dart';
import 'package:train/pages/home/widgets/body/ads/adsslids.dart';
import 'widgets/appbar/profile_drawer.dart';
import 'widgets/appbar/sitting_drawer.dart';
import 'widgets/body/searchcolum/searchbar.dart';
import 'widgets/body/category/category.dart';
import 'widgets/body/stores/stores_horizontal_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategoryId;
  final ScrollController _scrollController = ScrollController();

  void onCategorySelected(String? categoryId) {
    setState(() {
      if (selectedCategoryId == categoryId) {
        selectedCategoryId = null;
      } else {
        selectedCategoryId = categoryId;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SittingDrawer(),
      endDrawer: const ProfileDrawer(),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverToBoxAdapter(
              child: SizedBox(height: 10), // هامش صغير أعلى البحث
            ),
            const SliverToBoxAdapter(child: Searchbar()),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const DefaultAdsSlider(),
              const SizedBox(height: 10),
              Category(
                selectedCategoryId: selectedCategoryId,
                onCategorySelected: onCategorySelected,
              ),
              const SizedBox(height: 10),
              StoresHorizontalList(categoryId: selectedCategoryId),
              const SizedBox(height: 20), // هامش سفلي
            ],
          ),
        ),
      ),
    );
  }
}
