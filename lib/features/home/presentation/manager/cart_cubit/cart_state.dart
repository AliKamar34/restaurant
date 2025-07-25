part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final List<CartItemModel> cartItems;
  final double totalPrice;
  CartSuccess({required this.cartItems, required this.totalPrice});
}

final class CartFailure extends CartState {
  final String errMessage;
  CartFailure({required this.errMessage});
}
