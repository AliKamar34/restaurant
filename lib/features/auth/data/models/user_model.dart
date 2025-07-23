import 'package:restaurant/core/utils/constants/user_collection_data_contants.dart';

class UserModel {
  final String name;
  final String email;
  final String? image;

  UserModel({required this.name, required this.email, this.image});

  factory UserModel.fromJson(jsondata) {
    return UserModel(
      name: jsondata[UserCollectionDataContants.userName],
      email: jsondata[UserCollectionDataContants.userEmail],
    );
  }
}
