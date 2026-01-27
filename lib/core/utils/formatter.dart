import 'package:intl/intl.dart';

String formatCurrency(num value) {
  return '${NumberFormat('#,###', 'vi_VN').format(value)} đ';
}
