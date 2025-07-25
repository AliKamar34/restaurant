import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/functions/show_toast.dart';
import 'package:restaurant/core/widgets/custom_button.dart';
import 'package:restaurant/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_deleting_alert.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_grid_idicator.dart';
import 'package:restaurant/features/home/presentation/views/widgets/grid_cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
          showToast(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is CartSuccess) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio:
                        MediaQuery.sizeOf(context).aspectRatio * 2.19,
                  ),
                  itemCount: state.cartItems.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        final cartCubit = context.read<CartCubit>();
                        showDialog(
                          context: context,
                          builder: (context) => BlocProvider.value(
                            value: cartCubit,
                            child: CustomDeletingAlert(
                              item: state.cartItems[index],
                            ),
                          ),
                        );
                      },
                      child: GridCartItem(
                        cartItemModel: state.cartItems[index],
                      ),
                    );
                  },
                ),
              ),
              CustomButton(
                onPressed: () {},
                text: 'Checkout (\$${state.totalPrice.toStringAsFixed(2)})',
              ),
            ],
          );
        } else {
          return CustomGridIdicator();
        }
      },
    );
  }
}
