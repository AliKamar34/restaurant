import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failuer_error.dart';
import 'package:restaurant/core/utils/constants/menu_collection_data_constants.dart';
import 'package:restaurant/features/home/data/models/menu_item_model.dart';
import 'package:restaurant/features/home/data/repos/menu_repo.dart';

class MenuRepoImpl extends MenuRepo {
  @override
  Future<Either<Failure, List<MenuItemModel>>> getMenuItems() async {
    try {
      List<MenuItemModel> menuItems = [];
      CollectionReference menuCollection = FirebaseFirestore.instance
          .collection(MenuCollectionDataConstants.menuCollection);

      QuerySnapshot snapshot = await menuCollection.get();

      for (var doc in snapshot.docs) {
        menuItems.add(
          MenuItemModel.fromJson(doc.data() as Map<String, dynamic>),
        );
      }

      return right(menuItems);
    } catch (e) {
      return left(NetworkFailure(e.toString()));
    }
  }
}
