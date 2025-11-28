import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arabic_font/arabic_font.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 30, right: 20, left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Container(
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 0.5,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/icons/Filter.svg',
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icons/Search.svg',
              color: Colors.orange,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          hintText: 'ابحث عن الطعام...',
          hintTextDirection: TextDirection.rtl,
          hintStyle: ArabicTextStyle(
            arabicFont: ArabicFont.dinNextLTArabic,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
