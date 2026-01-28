import 'package:flutter/cupertino.dart';
import 'package:vending/features/payments/payment_method.dart';
import 'package:vending/features/payments/payment_service.dart';

class PaymentProvider extends ChangeNotifier {
  final PaymentService _service;

  PaymentProvider(this._service);

  List<PaymentMethodItem> _methods = [];
  PaymentMethodItem? _selected;
  bool _isLoading = false;

  List<PaymentMethodItem> get methods => _methods;
  PaymentMethodItem? get selected => _selected;
  bool get isLoading => _isLoading;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    _methods = await _service.fetchPaymentMethods();
    _selected = _methods.first;

    _isLoading = false;
    notifyListeners();
  }

  void select(PaymentMethodItem method) {
    _selected = method;
    notifyListeners();
  }
}


