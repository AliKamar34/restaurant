import 'package:restaurant/core/utils/constants/cart_collection_data_constant.dart';

class CartItemModel {
  final String name;
  final String imageUrl;
  final double price;
  final num quantity;

  CartItemModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      name: json[CartCollectionDataConstant.cartItemName] as String,
      imageUrl: json[CartCollectionDataConstant.cartItemImage] as String,
      price: (json[CartCollectionDataConstant.cartItemPrice] as num).toDouble(),
      quantity: (json[CartCollectionDataConstant.cartItemQuantity] as num)
          .toDouble(),
    );
  }
}
