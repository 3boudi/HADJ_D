import 'package:flutter/material.dart';

class SittingDrawer extends StatelessWidget {
  const SittingDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          SizedBox(height: 100),
          Text('Settings', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
