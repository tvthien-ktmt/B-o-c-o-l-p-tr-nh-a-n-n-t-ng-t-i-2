import 'package:json_annotation/json_annotation.dart';
import 'product.dart';
part 'cart_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
