import 'package:flutter/material.dart';
import 'package:vending/core/styles/colors.dart';
import 'package:vending/features/orders/order_item_model.dart';
import '../../../core/utils/formatter.dart';
import '../../orders/order_provider.dart';
import 'package:provider/provider.dart';

class OrderItemCard extends StatelessWidget {
  final OrderItem item;
  final VoidCallback? onTap;
  const OrderItemCard({super.key, required this.item, this.onTap});

  static const double itemHeight = 80;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: itemHeight,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              _buildImage(),
              const SizedBox(width: 12),
              _buildInfo(),
              _buildAction(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.network(item.product.imageUrl, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildInfo() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 4),
          Text(
            '${formatCurrency(item.product.price)} x ${item.quantity}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildAction(BuildContext context) {
    final order = context.watch<OrderProvider>();
    final qty = order.getQuantity(item.product.id);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              constraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.remove_circle_outline, size: 18),
              color: AppColors.iconPrimary,
              onPressed: () {
                context.read<OrderProvider>().remove(item.product);
              },
            ),
            const SizedBox(width: 4,),
            Text(
              qty.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.iconPrimary,
              ),
            ),
            const SizedBox(width: 4,),
            IconButton(
              constraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add_circle_outline, size: 18),
              color: AppColors.iconPrimary,
              onPressed: () {
                context.read<OrderProvider>().add(item.product);
              },
            ),
          ],
        ),
        Text(
          formatCurrency(qty*item.product.price),
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
