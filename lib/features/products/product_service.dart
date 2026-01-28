import 'product_model.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Product(
        id: 1,
        name: 'Sản phẩm 1',
        description: 'Dầu tẩy trang AHA',
        price: 300000,
        imageUrl: 'https://cf.shopee.vn/file/vn-11134207-7ras8-m405zfcbhw9s1e',
      ),
      Product(
        id: 2,
        name: 'Sản phẩm 2',
        description: 'Dầu tẩy trang PHA',
        price: 250000,
        imageUrl: 'https://cf.shopee.vn/file/vn-11134207-7ras8-m405zp13birza9',
      ),
      Product(
        id: 3,
        name: 'Sản phẩm 3',
        description: 'Huxley Scrub Mask Deluxe(30g)',
        price: 125000,
        imageUrl: 'https://cf.shopee.vn/file/vn-11134207-7ras8-mc5rgj7ixq424f',
      ),
      Product(
        id: 4,
        name: 'Sản phẩm 4',
        description: 'Bộ Vòi Sen Lọc Nước Atojet AJ-8200',
        price: 650000,
        imageUrl: 'https://vas.nhgorganization.com/server/retail/Images/Products/4370.png',
      ),
      Product(
        id: 5,
        name: 'Sản phẩm 5',
        description: 'ARUMCOLOR Waterproof Slim Liquid Eyeliner Black',
        price: 350000,
        imageUrl: 'https://cf.shopee.vn/file/vn-11134207-820l4-mdycxlwbgvsxd4',
      ),
      Product(
        id: 6,
        name: 'Sản phẩm 6',
        description: 'Secret Key Snow White Milky Pack',
        price: 250000,
        imageUrl: 'https://cf.shopee.vn/file/vn-11134207-820l4-mdwjrhuoyzggc9',
      ),
    ];
  }
}
