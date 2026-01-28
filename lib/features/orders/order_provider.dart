import 'package:flutter/cupertino.dart';

import '../products/product_model.dart';
import 'order_item_model.dart';

class OrderProvider extends ChangeNotifier {
  final Map<int, OrderItem> _items = {};
  Map<int, OrderItem> get items => _items;

  void add(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = OrderItem(product: product);
    }
    notifyListeners();
  }

  void remove(Product product) {
    if (!_items.containsKey(product.id)) return;

    if (_items[product.id]!.quantity > 1) {
      _items[product.id]!.quantity--;
    } else {
      _items.remove(product.id);
    }
    notifyListeners();
  }

  void removeAll(Product product) {
    _items.remove(product.id);
    notifyListeners();
  }

  int getQuantity(int productId) =>
      _items[productId]?.quantity ?? 0;

  double get totalPrice =>
      _items.values.fold(0, (sum, e) => sum + e.totalPrice);

  int get totalItems =>
      _items.values.fold(0, (sum, e) => sum + e.quantity);

  bool get hasItems => _items.isNotEmpty;
}
