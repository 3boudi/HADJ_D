import 'package:flutter/material.dart';
import 'package:train/home/widgets/body/stores/storesmodel.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  List<StoresModel> stores = [];

  @override
  void initState() {
    super.initState();
    _getStores();
  }

  void _getStores() {
    stores = StoresModel.getStores()!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
