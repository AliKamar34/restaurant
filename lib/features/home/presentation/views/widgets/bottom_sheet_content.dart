import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/app_text_styles.dart';
import 'package:restaurant/core/widgets/custom_button.dart';

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
    return Column(
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
        Text(name, style: TextStyles.medium16(context)),

        Text('$price \$ ', style: TextStyles.medium14(context)),
        const SizedBox(height: 20),
        CustomButton(onPressed: () {}, text: 'Add to Cart'),
      ],
    );
  }
}
