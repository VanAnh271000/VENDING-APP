import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  final Map<int, int> _items = {};
  final Map<int, int> _prices = {};
  int getQuantity(int productId) => _items[productId] ?? 0;

  void add(int productId, int price) {
    _items[productId] = (_items[productId] ?? 0) + 1;
    _prices[productId] = price;
    notifyListeners();
  }

  void remove(int productId) {
    final current = getQuantity(productId);
    if (current <= 1) {
      _items.remove(productId);
      _prices.remove(productId);
    } else {
      _items[productId] = current - 1;
    }
    notifyListeners();
  }

  int get totalItems => _items.values.fold(0, (sum, qty) => sum + qty);

  int get totalPrice {
    int total = 0;
    _items.forEach((id, qty){
      total += qty* (_prices[id] ?? 0);
    });
    return total;
  }

  bool get hasItems => _items.isNotEmpty;
}
