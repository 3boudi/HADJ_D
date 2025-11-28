import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppbarLeading extends StatelessWidget {
  const AppbarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/settings-svgrepo-com.svg',
              height: 25,
              width: 25,
              color: Colors.orange,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}
