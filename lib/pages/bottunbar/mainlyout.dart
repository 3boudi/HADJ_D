import 'package:flutter/material.dart';
import 'buttumbar.dart';
import '../settings/settings.dart';
import '../home/home.dart';
import '../profile/profile.dart';
import 'package:train/constants/colors.dart';
import 'package:train/pages/home/widgets/appbar/appbar.dart';
import 'package:train/pages/home/widgets/appbar/profile_drawer.dart';
import 'package:train/pages/home/widgets/appbar/sitting_drawer.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 1;

  final List<Widget> screens = [
    const Settings(),
    const HomePage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SittingDrawer(),
      endDrawer: const ProfileDrawer(),
      appBar: const CustomAppBar(),
      body: screens[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        items: [
          CustomBottomNavItem(
            icon: Icons.list_alt,
            title: 'طلبات',
            selectedColor: AppColors.primary,
            onTap: () => setState(() => currentIndex = 0),
          ),
          CustomBottomNavItem(
            icon: Icons.home,
            title: 'الرئيسية',
            selectedColor: AppColors.primary,
            onTap: () => setState(() => currentIndex = 1),
          ),
          CustomBottomNavItem(
            icon: Icons.shopping_basket,
            title: 'سلة',
            selectedColor: AppColors.primary,
            onTap: () => setState(() => currentIndex = 2),
          ),
        ],
      ),
    );
  }
}
