import 'order_item_model.dart';

class Order {
  final Map<String, OrderItem> items;

  Order({required this.items});

  int get totalItems =>
      items.values.fold(0, (sum, e) => sum + e.quantity);

  double get totalPrice =>
      items.values.fold(0, (sum, e) => sum + e.totalPrice);
}
