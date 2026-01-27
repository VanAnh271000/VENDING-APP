import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vending/features/payments/payment_provider.dart';
import 'package:vending/features/payments/payment_service.dart';
import 'app.dart';
import 'features/orders/order_provider.dart';
import 'features/products/product_provider.dart';
import 'features/products/product_service.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductProvider(ProductService())..load()),
          ChangeNotifierProvider(create: (_) => OrderProvider()),
          ChangeNotifierProvider(create: (_) => PaymentProvider(PaymentService())..load()),
        ],
        child: const VendingApp(),
      )
  );
}
