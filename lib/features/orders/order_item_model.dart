import '../products/product_model.dart';

class OrderItem {
  final Product product;
  int quantity;

  OrderItem({
    required this.product,
    this.quantity = 1,
  });

  int get totalPrice => product.price * quantity;
}
