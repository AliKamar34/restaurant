import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/app_text_styles.dart';
import 'package:restaurant/core/widgets/custom_container.dart';
import 'package:restaurant/features/home/data/models/menu_item_model.dart';

class GridMenuItem extends StatelessWidget {
  const GridMenuItem({super.key, required this.menuItemModel});
  final MenuItemModel menuItemModel;
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
              imageUrl: menuItemModel.imageUrl,
            ),
          ),
          Text(menuItemModel.name, style: TextStyles.medium16(context)),

          Text(
            menuItemModel.price.toString(),
            style: TextStyles.medium14(context),
          ),
        ],
      ),
    );
  }
}
