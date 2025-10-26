class Product {
  final String id;
  final String name;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });

  // JSON → Object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }

  // Object → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}

void main() {
  // 1️ JSON dữ liệu đầu vào
  final jsonData = {'id': 'P001', 'name': 'Laptop Acer', 'price': 15500000.0};

  // 2️ JSON → Object
  final product = Product.fromJson(jsonData);
  print('Tên sản phẩm: ${product.name}');
  print('Giá: ${product.price}');

  // 3️ Object → JSON
  final jsonOutput = product.toJson();
  print('Dữ liệu JSON sau khi xuất: $jsonOutput');
}
