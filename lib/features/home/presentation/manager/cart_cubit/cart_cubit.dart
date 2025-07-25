import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/home/data/models/cart_item_model.dart';
import 'package:restaurant/features/home/data/repos/menu_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.menuRepo) : super(CartInitial());
  final MenuRepo menuRepo;
  Future<void> getcartItems() async {
    emit(CartLoading());
    var menuItemsResult = await menuRepo.getcartItems();
    menuItemsResult.fold(
      (failure) {
        emit(CartFailure(errMessage: failure.errorMessage));
      },
      (cartItems) {
        double calculateTotalPrice(List<CartItemModel> cartItems) {
          double total = 0.0;
          for (var item in cartItems) {
            total += item.price * item.quantity;
          }
          return total;
        }

        emit(
          CartSuccess(
            cartItems: cartItems,
            totalPrice: calculateTotalPrice(cartItems),
          ),
        );
      },
    );
  }
}
