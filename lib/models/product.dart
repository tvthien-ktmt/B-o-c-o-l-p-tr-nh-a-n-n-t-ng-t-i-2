import 'package:json_annotation/json_annotation.dart';
import 'category.dart';
part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final Category category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
