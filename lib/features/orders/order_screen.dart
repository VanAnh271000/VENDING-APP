import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vending/features/orders/order_item_model.dart';
import 'package:vending/features/orders/widgets/order_bottom_bar.dart';
import 'package:vending/features/orders/widgets/order_item_card.dart';
import '../payments/payment_screen.dart';
import 'order_provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final order = context.watch<OrderProvider>();
    final items = order.items.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Xác nhận đơn hàng')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) =>
        const Divider(height: 1, thickness: 1),
        itemBuilder: (context, index) {
          final item = items[index];
          return OrderItemCard(
            item: item,
            onTap: () {},
          );
        },
      ),
      bottomNavigationBar: OrderBottomBar(
        onCheckout: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PaymentScreen(),
            ),
          );
        },
      ),
    );
  }
}
