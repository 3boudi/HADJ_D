import 'package:flutter/material.dart';
import 'widgets/appbar/appbar.dart';
import 'widgets/appbar/profile_drawer.dart';
import 'widgets/appbar/sitting_drawer.dart';
import 'widgets/body/searchcolum/searchbar.dart';
import 'widgets/body/category/category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SittingDrawer(),
      endDrawer: const ProfileDrawer(),
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Searchbar(),
          SizedBox(height: 40),
          Category(),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
