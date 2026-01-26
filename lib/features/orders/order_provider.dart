import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  final Map<int, int> _items = {};

  int getQuantity(int productId) => _items[productId] ?? 0;

  void add(int productId) {
    _items[productId] = getQuantity(productId) + 1;
    notifyListeners();
  }

  void remove(int productId) {
    final current = getQuantity(productId);
    if (current <= 1) {
      _items.remove(productId);
    } else {
      _items[productId] = current - 1;
    }
    notifyListeners();
  }
}
