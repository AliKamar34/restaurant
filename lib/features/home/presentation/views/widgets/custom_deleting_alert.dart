import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/utils/app_colors.dart';
import 'package:restaurant/core/utils/app_text_styles.dart';
import 'package:restaurant/core/utils/functions/show_toast.dart';
import 'package:restaurant/core/widgets/custom_button.dart';
import 'package:restaurant/features/home/data/models/cart_item_model.dart';
import 'package:restaurant/features/home/data/repos/menu_repo_impl.dart';
import 'package:restaurant/features/home/presentation/manager/cart_cubit/cart_cubit.dart';

class CustomDeletingAlert extends StatelessWidget {
  const CustomDeletingAlert({super.key, required this.item});
  final CartItemModel item;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text('Warning', style: TextStyles.medium18(context)),
      ),
      content: Text(
        'Are you sure you want to delete this item from the cart?',
        style: TextStyles.medium16(context),
      ),
      actions: [
        CustomButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          text: 'Exit',
        ),
        SizedBox(height: 20),
        CustomButton(
          onPressed: () {
            MenuRepoImpl().deleteFromCart(item);
            BlocProvider.of<CartCubit>(context).getcartItems();
            GoRouter.of(context).pop();
            showToast(context, 'Item removed from cart');
          },

          text: 'Delete',
          backgroundColor: AppColors.importantButtonsBackgroundColor,
        ),
      ],
    );
  }
}
