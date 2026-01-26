import 'package:flutter/material.dart';
import 'product_model.dart';
import 'product_service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> products = [];
  bool isLoading = false;

  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    products = await _service.fetchProducts();

    isLoading = false;
    notifyListeners();
  }
}
