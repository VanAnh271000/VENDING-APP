import 'package:flutter/material.dart';
import 'package:vending/core/styles/colors.dart';
import '../../../core/utils/formatter.dart';
import '../../orders/order_provider.dart';
import '../product_model.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  const ProductCard({super.key, required this.product, this.onTap});

  static const double itemHeight = 100;

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
        child: Image.network(product.imageUrl, fit: BoxFit.cover),
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
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 4),
          Text(
            product.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 4),
          Text(
            formatCurrency(product.price),
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
    final qty = order.getQuantity(product.id);

    if (qty == 0) {
      return IconButton(
        icon: const Icon(Icons.add_circle),
        color: AppColors.iconPrimary,
        onPressed: () {
          context.read<OrderProvider>().add(product);
        },
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              color: AppColors.iconPrimary,
              onPressed: () {
                context.read<OrderProvider>().remove(product);
              },
            ),
            Text(
              qty.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.iconPrimary,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              color: AppColors.iconPrimary,
              onPressed: () {
                context.read<OrderProvider>().add(product);
              },
            ),
          ],
        ),
        Text(
          formatCurrency(qty*product.price),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
