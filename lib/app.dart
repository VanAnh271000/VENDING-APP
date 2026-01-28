import 'package:flutter/material.dart';
import 'features/products/product_screen.dart';

class VendingApp extends StatelessWidget {
  const VendingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProductScreen(),
    );
  }
}
