import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failuer_error.dart';
import 'package:restaurant/core/utils/constants/cart_collection_data_constant.dart';
import 'package:restaurant/core/utils/constants/menu_collection_data_constants.dart';
import 'package:restaurant/features/home/data/models/cart_item_model.dart';
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

  @override
  Future<Either<Failure, void>> addToCart(CartItemModel cartItem) async {
    try {
      CollectionReference cartCollection = FirebaseFirestore.instance
          .collection(CartCollectionDataConstant.cartCollectionName);
      await cartCollection.add({
        CartCollectionDataConstant.cartItemName: cartItem.name,
        CartCollectionDataConstant.cartItemImage: cartItem.imageUrl,
        CartCollectionDataConstant.cartItemPrice: cartItem.price,
        CartCollectionDataConstant.cartItemQuantity: cartItem.quantity,
      });
      return right(null);
    } catch (e) {
      return left(NetworkFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CartItemModel>>> getcartItems() async {
    try {
      List<CartItemModel> cartItems = [];
      CollectionReference cartCollection = FirebaseFirestore.instance
          .collection(CartCollectionDataConstant.cartCollectionName);
      QuerySnapshot snapshot = await cartCollection.get();

      for (var doc in snapshot.docs) {
        cartItems.add(
          CartItemModel.fromJson(doc.data() as Map<String, dynamic>),
        );
      }

      return right(cartItems);
    } catch (e) {
      return left(NetworkFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFromCart(CartItemModel cartItem) async {
    try {
      CollectionReference cartCollection = FirebaseFirestore.instance
          .collection(CartCollectionDataConstant.cartCollectionName);
      await cartCollection
          .where(
            CartCollectionDataConstant.cartItemName,
            isEqualTo: cartItem.name,
          )
          .where(
            CartCollectionDataConstant.cartItemImage,
            isEqualTo: cartItem.imageUrl,
          )
          .where(
            CartCollectionDataConstant.cartItemPrice,
            isEqualTo: cartItem.price,
          )
          .where(
            CartCollectionDataConstant.cartItemQuantity,
            isEqualTo: cartItem.quantity,
          )
          .get()
          .then((snapshot) {
            for (var doc in snapshot.docs) {
              doc.reference.delete();
            }
          });

      return right(null);
    } catch (e) {
      return left(NetworkFailure(e.toString()));
    }
  }
}
