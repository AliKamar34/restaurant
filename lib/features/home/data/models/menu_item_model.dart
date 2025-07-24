import 'package:restaurant/core/utils/constants/menu_collection_data_constants.dart';

class MenuItemModel {
  final String name;
  final String imageUrl;
  final double price;

  MenuItemModel({
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      name: json[MenuCollectionDataConstants.itemName] as String,
      imageUrl: json[MenuCollectionDataConstants.itemImage] as String,
      price: (json[MenuCollectionDataConstants.itemPrice] as num).toDouble(),
    );
  }
}
