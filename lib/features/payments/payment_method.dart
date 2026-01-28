enum PaymentMethodType {
  qr,
  momo,
  zaloPay,
  vnPay
}

class PaymentMethodItem {
  final PaymentMethodType type;
  final String title;
  final String icon; // asset path
  final String? description;

  const PaymentMethodItem({
    required this.type,
    required this.title,
    required this.icon,
    this.description,
  });
}