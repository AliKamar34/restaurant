import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/utils/app_text_styles.dart';
import 'package:restaurant/core/utils/functions/show_toast.dart';
import 'package:restaurant/core/widgets/custom_button.dart';
import 'package:restaurant/features/home/data/models/cart_item_model.dart';
import 'package:restaurant/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:restaurant/features/home/presentation/views/widgets/small_quantity_selector.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });
  final String image, name;
  final num price;
  @override
  Widget build(BuildContext context) {
    num quantity = 1;
    return Column(
      spacing: 15,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: image,
          ),
        ),
        Text(name, style: TextStyles.medium20(context)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$price \$ ', style: TextStyles.medium18(context)),
            SmallBlurQuantitySelector(
              onChanged: (value) {
                quantity = value;
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: () {
            BlocProvider.of<CartCubit>(context).menuRepo.addToCart(
              CartItemModel(
                name: name,
                imageUrl: image,
                price: price.toDouble(),
                quantity: quantity,
              ),
            );
            GoRouter.of(context).pop();
            showToast(context, 'added to cart');
          },
          text: 'Add to Cart',
        ),
      ],
    );
  }
}
