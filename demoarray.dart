// Model con: Order
class Order {
  final String id;
  final double total;
  Order({required this.id, required this.total});
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      total: json['total'].toDouble(),
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'total': total};
  }
}
// Model cha: User
class User {
  final String name;
  final List<Order> orders; // Danh sách object

  User({required this.name, required this.orders});

  factory User.fromJson(Map<String, dynamic> json) {
    var list = json['orders'] as List;
    List<Order> orderList = list.map((e) => Order.fromJson(e)).toList();
    return User(name: json['name'], orders: orderList);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'orders': orders.map((e) => e.toJson()).toList(),
    };
  }
}

void main() {
  final jsonData = {
    'name': 'Nguyen Van A',
    'orders': [
      {'id': 'O001', 'total': 1200000},
      {'id': 'O002', 'total': 2300000}
    ]
  };

  // JSON → Object
  final user = User.fromJson(jsonData);
  print('Tên: ${user.name}');
  print('Số đơn hàng: ${user.orders.length}');
  print('Mã đơn đầu tiên: ${user.orders[0].id}');

  // Object → JSON
  print('JSON xuất ra: ${user.toJson()}');
}
