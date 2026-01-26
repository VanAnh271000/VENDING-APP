import 'package:flutter/material.dart';
import '../../../core/utils/formatter.dart';
import '../../orders/order_provider.dart';
import '../product_model.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  static const double itemHeight = 120;

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
        aspectRatio: 1, // 👈 hình vuông
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
            style: TextStyle(color: Colors.blueAccent),
          ),
          const SizedBox(height: 4),
          Text(
            product.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            formatCurrency(product.price),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey),
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
        color: Colors.blueAccent,
        onPressed: () {
          context.read<OrderProvider>().add(product.id);
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
              color: Colors.blueAccent,
              onPressed: () {
                context.read<OrderProvider>().remove(product.id);
              },
            ),
            Text(
              qty.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              color: Colors.blueAccent,
              onPressed: () {
                context.read<OrderProvider>().add(product.id);
              },
            ),
          ],
        ),
        Text(
          formatCurrency(qty*product.price),
          style: const TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
