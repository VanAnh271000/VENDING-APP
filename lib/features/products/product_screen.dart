import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vending/features/orders/widgets/order_bottom_bar.dart';
import 'package:vending/features/products/widgets/product_app_bar.dart';
import 'package:vending/features/products/widgets/product_card.dart';
import '../../core/styles/colors.dart';
import '../orders/order_screen.dart';
import 'product_provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: ProductAppBar(),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: provider.products.length,
              separatorBuilder: (_, __) => const Divider(
                height: 1,
                thickness: 1,
                color: AppColors.divider,
              ),
              itemBuilder: (context, index) {
                final product = provider.products[index];
                return ProductCard(
                  product: product,
                  onTap: () {
                    debugPrint('Selected: ${product.name}');
                  },
                );
              },
            ),
      bottomNavigationBar: OrderBottomBar(
        onCheckout: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const OrderScreen(),
            ),
          );
        },
      ),
    );
  }
}
