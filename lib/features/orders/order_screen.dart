import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vending/features/orders/widgets/order_bottom_bar.dart';
import 'package:vending/features/orders/widgets/order_item_card.dart';
import '../../core/styles/colors.dart';
import '../payments/payment_provider.dart';
import '../payments/widgets/payment_method_section.dart';
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
      appBar: AppBar(
        title: const Text('Xác nhận đơn hàng'),
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: const Text(
              'Tóm tắt sản phẩm',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, thickness: 1),
              itemBuilder: (context, index) {
                final item = items[index];
                return Dismissible(
                  key: ValueKey(item),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    context.read<OrderProvider>().removeAll(item.product);
                  },
                  confirmDismiss: (_) async {
                    return await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Xoá sản phẩm'),
                        content: const Text('Bạn có chắc muốn xoá sản phẩm này khỏi đơn hàng?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Huỷ', style: TextStyle(color: AppColors.success),),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Xoá', style: TextStyle(color: AppColors.error),),
                          ),
                        ],
                      ),
                    );
                  },
                  background: _buildSwipeToDeleteBg(),
                  child: OrderItemCard(item: item),
                );
              },
            ),
          ),
          PaymentMethodSection(),
        ],
      ),
      bottomNavigationBar: OrderBottomBar(
        onCheckout: () {
          final payment = context.read<PaymentProvider>();
          final order = context.read<OrderProvider>();

          if (payment.selected == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Vui lòng chọn phương thức thanh toán')),
            );
            return;
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PaymentScreen(
                method: payment.selected!,
                items: order.items.values.toList(),
              ),
            ),
          );
        },
      ),
    );
  }
  Widget _buildSwipeToDeleteBg() {
    return Container(
      color: AppColors.error,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
        size: 28,
      ),
    );
  }

}
