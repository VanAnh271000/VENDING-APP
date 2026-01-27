import 'package:flutter/material.dart';
import 'package:vending/features/payments/payment_method.dart';
import 'package:vending/features/payments/payment_success_screen.dart';
import '../orders/order_item_model.dart';

class PaymentScreen extends StatefulWidget {
  final PaymentMethodItem method;
  final List<OrderItem> items;

  const PaymentScreen({
    super.key,
    required this.method,
    required this.items,
  });

  @override
  State<PaymentScreen> createState() =>
      _PaymentScreenState();
}
class _PaymentScreenState extends State<PaymentScreen> {
  bool isProcessing = true;

  @override
  void initState() {
    super.initState();
    _processPayment();
  }

  Future<void> _processPayment() async {
    await Future.delayed(const Duration(seconds: 2)); 

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const PaymentSuccessScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đang thanh toán')),
      body: Center(
        child: isProcessing
            ? const CircularProgressIndicator()
            : const Text('Hoàn tất'),
      ),
    );
  }
}
