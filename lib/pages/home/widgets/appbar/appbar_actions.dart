import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:train/constants/colors.dart';

class AppbarActions extends StatelessWidget {
  const AppbarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/user-svgrepo-com.svg',
              height: 25,
              width: 25,
              color: AppColors.primary,
            ),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}
