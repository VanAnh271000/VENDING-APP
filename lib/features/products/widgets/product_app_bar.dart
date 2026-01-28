import 'package:flutter/material.dart';
import 'package:vending/core/styles/colors.dart';

class ProductAppBar extends StatelessWidget
    implements PreferredSizeWidget {

  const ProductAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(124);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF60A5FA),
                Color(0xFF2563EB),
              ],
            ),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
        ),
        child: Row(
          children: [
            // const Icon(Icons.store, color: AppColors.iconSecondary,),
            // const SizedBox(width: 8),
            const Text(
              'Danh sách sản phẩm',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textTertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),

          ],
        ),
      ),
    );
  }
}
