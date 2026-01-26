import 'product_model.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Product(
        id: 1,
        name: 'Sản phẩm 1',
        description: 'Dầu tẩy trang AHA',
        price: 30000,
        imageUrl: 'https://cf.shopee.vn/file/vn-11134207-7ras8-m405zfcbhw9s1e',
      ),
      Product(
        id: 2,
        name: 'Sản phẩm 2',
        description: 'Dầu tẩy trang PHA',
        price: 25000,
        imageUrl: 'https://cf.shopee.vn/file/vn-11134207-7ras8-m405zp13birza9',
      ),
    ];
  }
}
