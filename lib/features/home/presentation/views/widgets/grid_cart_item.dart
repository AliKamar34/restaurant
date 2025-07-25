import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/app_text_styles.dart';
import 'package:restaurant/core/widgets/custom_container.dart';
import 'package:restaurant/features/home/data/models/cart_item_model.dart';

class GridCartItem extends StatelessWidget {
  const GridCartItem({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              height: 75,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: cartItemModel.imageUrl,
            ),
          ),
          Text(cartItemModel.name, style: TextStyles.medium16(context)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${cartItemModel.price} \$ ',
                style: TextStyles.medium14(context),
              ),
              Text(
                '${cartItemModel.quantity.toInt()} pieces ',
                style: TextStyles.medium14(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
