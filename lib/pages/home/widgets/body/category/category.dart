import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'categorymodel.dart';
import 'package:arabic_font/arabic_font.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  void _getCategories() {
    categories = CategoryModel.getCategories()!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                'الفئات',
                style: ArabicTextStyle(
                  arabicFont: ArabicFont.dinNextLTArabic,
                  color: const Color(0xFFFF6B35),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 120,
          color: Colors.white,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 15, left: 15),
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              return Container(
                width: 90,
                decoration: BoxDecoration(
                  color: categories[index].boxColor!.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: categories[index].boxColor!.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: categories[index].boxColor!.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          categories[index].iconPath!,
                          color: categories[index].boxColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        categories[index].name ?? '',
                        textAlign: TextAlign.center,
                        style: ArabicTextStyle(
                          arabicFont: ArabicFont.dinNextLTArabic,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
