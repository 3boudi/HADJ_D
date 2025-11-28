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
      drawer: const SittingDrawer(), // أصبح الدراور الأيمن للملف الشخصي
      endDrawer: const ProfileDrawer(), // أصبح الدراور الأيسر للإعدادات
      appBar: const CustomAppBar(),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Searchbar(),
            SizedBox(height: 30),
            Category(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
