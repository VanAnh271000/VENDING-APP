import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/styles/colors.dart';
import '../../../core/utils/formatter.dart';
import '../order_provider.dart';

class OrderBottomBar extends StatelessWidget {
  final VoidCallback onCheckout;

  const OrderBottomBar({super.key, required this.onCheckout});

  @override
  Widget build(BuildContext context) {
    final order = context.watch<OrderProvider>();

    if (!order.hasItems) return const SizedBox.shrink();

    return SafeArea(
      child: SizedBox(
        height: 72,
        child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onCheckout,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Text(
                'Thanh toán:',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textTertiary,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${order.totalItems} sản phẩm',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
              ),
              const Spacer(),
              Text(
                formatCurrency(order.totalPrice),
                style: const TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}
