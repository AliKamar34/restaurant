import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failuer_error.dart';
import 'package:restaurant/features/home/data/models/cart_item_model.dart';
import 'package:restaurant/features/home/data/models/menu_item_model.dart';

abstract class MenuRepo {
  Future<Either<Failure, List<MenuItemModel>>> getMenuItems();
  Future<Either<Failure, void>> addToCart(CartItemModel cartItem);
  Future<Either<Failure, void>> deleteFromCart(CartItemModel cartItem);

  Future<Either<Failure, List<CartItemModel>>> getcartItems();
}
