import 'package:flutter/material.dart';
import 'appbar_leading.dart';
import 'appbar_actions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'HADJ DELIVERY',
        style: TextStyle(
          color: Color.fromARGB(255, 255, 68, 0),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: const AppbarLeading(),
      actions: const [AppbarActions()],
    );
  }
}
