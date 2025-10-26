// Model con: Address
class Address {
  final String city;
  final String street;
  Address({
    required this.city,
    required this.street,
  });
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      street: json['street'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'street': street,
    };
  }
}

// Model cha: User
class User {
  final String name;
  final Address address; // Nested Object

  User({
    required this.name,
    required this.address,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      address: Address.fromJson(json['address']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address.toJson(),
    };
  }
}

void main() {
  // JSON đầu vào
  final jsonData = {
    'name': 'Nguyen Van A',
    'address': {'city': 'Hanoi', 'street': 'Tran Hung Dao'}
  };

  // JSON → Object
  final user = User.fromJson(jsonData);
  print('Tên người dùng: ${user.name}');
  print('Đường: ${user.address.street}');
  print('Thành phố: ${user.address.city}');

  // Object → JSON
  final output = user.toJson();
  print('JSON xuất ra: $output');
}
