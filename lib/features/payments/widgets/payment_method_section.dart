import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/styles/colors.dart';
import '../payment_method.dart';
import '../payment_provider.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PaymentProvider>();
    if (provider.isLoading) {
      return const CircularProgressIndicator();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            'Phương thức thanh toán',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        ...provider.methods.map((method) {
          return Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              onTap: () {
                context.read<PaymentProvider>().select(method);
              },
              tileColor: AppColors.background,
              leading: Image.asset(
                method.icon,
                width: 32,
                height: 32,
              ),
              title: Text(
                method.title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: method.description?.isNotEmpty == true
                  ? Text(method.description!)
                  : null,
              trailing: Radio<PaymentMethodItem>(
                value: method,
                groupValue: provider.selected,
                onChanged: (value) {
                  context.read<PaymentProvider>().select(value!);
                },
              ),
            ),
          );
        }).toList(),
      ],
    );

  }
}
