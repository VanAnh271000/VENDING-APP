
import 'package:vending/features/payments/payment_method.dart';

class PaymentService {
  Future<List<PaymentMethodItem>> fetchPaymentMethods() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      PaymentMethodItem(
        icon: 'assets/images/qr_code.png',
        title: 'QR code',
        type: PaymentMethodType.qr,
        description: ''
      ),
      PaymentMethodItem(
          icon: 'assets/images/momo.png',
          title: 'Momo',
          type: PaymentMethodType.momo,
          description: ''
      ),
      PaymentMethodItem(
          icon: 'assets/images/zalo_pay.png',
          title: 'ZaloPay',
          type: PaymentMethodType.zaloPay,
          description: ''
      ),
      PaymentMethodItem(
          icon: 'assets/images/vn_pay.png',
          title: 'VNPay',
          type: PaymentMethodType.vnPay,
          description: ''
      ),
    ];
  }
}
