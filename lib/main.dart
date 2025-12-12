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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SittingDrawer(),
      endDrawer: const ProfileDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // البحث يكون هنا بدون AppBar
                const SizedBox(
                  height: kToolbarHeight + 10,
                ), // هامش لتعويض AppBar
                const Searchbar(),
                const SizedBox(height: 10),
                const DefaultAdsSlider(),
                const SizedBox(height: 10),
                Category(
                  selectedCategoryId: selectedCategoryId,
                  onCategorySelected: onCategorySelected,
                ),
                const SizedBox(height: 10),
                StoresHorizontalList(categoryId: selectedCategoryId),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
