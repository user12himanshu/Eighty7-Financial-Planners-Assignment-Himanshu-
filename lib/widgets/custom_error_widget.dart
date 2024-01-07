import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/constants/constants.dart';
import 'package:untitled/utils/theme_util.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.url,
    this.borderRadius,
  });

  final String url;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          borderRadius ?? BorderRadius.circular(ThemeUtils.defaultBorderRadius),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, image) =>
            Lottie.asset('${AppConstants.assetLottiePath}image_loading.json'),
        errorWidget: (context, image, e) => const Icon(
          Icons.broken_image_outlined,
          size: 20,
          color: ThemeUtils.primaryColor,
        ),
      ),
    );
  }
}
